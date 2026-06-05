---
name: hermes-voice-bridge
description: Bridge ElevenLabs voice agents to Hermes Agent for tool execution and custom logic. Use when building voice-enabled Hermes agents that need to execute tools, query APIs, or access project context.
triggers:
  - hermes
  - voice
  - elevenlabs
  - bridge
  - telephony
  - phone
agent: hermes
---

# Hermes Voice Bridge

## When to Use

When you want to call your Hermes agent over the phone or via voice interface, using ElevenLabs for STT/TTS and Hermes for the brain/tool execution.

## Architecture

```
User Phone → Twilio/Vonage → ElevenLabs (STT/TTS) → 
  WebSocket/API → Hermes Agent (logic + tools) →
  Response → ElevenLabs (TTS) → Phone
```

## Setup Steps

### 1. ElevenLabs Agent Configuration

Create an agent in ElevenLabs dashboard:
- **System Prompt**: "You are a voice assistant. Keep responses concise and conversational."
- **LLM**: Set to Custom LLM pointing to your Hermes endpoint
- **Voice**: Choose a natural-sounding voice (e.g., Josh, Rachel)
- **Model**: Turbo v2.5 for lowest latency

### 2. Hermes Bridge Endpoint

Create an API endpoint in your Hermes setup:

```typescript
// api/voice-chat.ts
export async function POST(request: Request) {
  const { message, session_id, context } = await request.json()
  
  // Build conversation context
  const messages = [
    { role: 'system', content: getSystemPrompt(context) },
    ...await getSessionHistory(session_id),
    { role: 'user', content: message }
  ]
  
  // Call Hermes LLM
  const response = await fetch(HERMES_API_URL, {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${HERMES_API_KEY}` },
    body: JSON.stringify({ messages, tools: availableTools })
  })
  
  const result = await response.json()
  
  // Execute any tool calls
  if (result.tool_calls) {
    const toolResults = await executeTools(result.tool_calls)
    // Send tool results back for final response
    const finalResponse = await fetch(HERMES_API_URL, {
      method: 'POST',
      body: JSON.stringify({ 
        messages: [...messages, result, ...toolResults] 
      })
    })
    return Response.json(await finalResponse.json())
  }
  
  return Response.json(result)
}
```

### 3. Custom LLM Integration (ElevenLabs)

In ElevenLabs dashboard, set Custom LLM:
- **URL**: `https://your-hermes-api.com/api/voice-chat`
- **Headers**: `Authorization: Bearer YOUR_TOKEN`
- **Model**: `hermes-voice`

### 4. Phone Number Setup

```typescript
// Twilio webhook
app.post('/voice', async (req, res) => {
  const twiml = new VoiceResponse()
  
  // Connect to ElevenLabs Conversational AI
  const connect = twiml.connect()
  connect.stream({
    url: `wss://api.elevenlabs.io/v1/convai/twilio/${ELEVENLABS_AGENT_ID}`
  })
  
  res.type('text/xml')
  res.send(twiml.toString())
})
```

## Hermes-Specific Considerations

1. **Tool Access**: Voice agents need the same tools as chat agents
   - File operations
   - Web search
   - Code execution
   - Database queries

2. **Context Management**: Voice sessions are stateful
   - Store session context in KV/D1
   - Summarize long conversations
   - Handle interruptions gracefully

3. **Response Formatting**: Voice needs different output
   - Shorter responses (30 words max per turn)
   - No markdown, code blocks, or URLs
   - Natural pauses with commas and periods
   - Spell out acronyms and numbers

4. **Error Handling**: Voice failures are more critical
   - Fallback to text SMS
   - Graceful degradation if tools fail
   - Retry with simpler prompts

## Example: TradePilot Voice Agent

```typescript
// tools/voice-trading.ts
export const tradingTools = {
  getPortfolio: async (userId: string) => {
    return await supabase
      .from('portfolios')
      .select('*')
      .eq('user_id', userId)
      .single()
  },
  
  executeTrade: async (symbol: string, action: 'buy' | 'sell', quantity: number) => {
    // Validation and execution
    return await tradingAPI.placeOrder({ symbol, action, quantity })
  },
  
  getMarketSummary: async () => {
    return await marketAPI.getDailySummary()
  }
}

// Voice-optimized responses
export function formatForVoice(data: any): string {
  if (data.portfolio) {
    const total = data.portfolio.total_value
    const change = data.portfolio.daily_change
    const direction = change >= 0 ? 'up' : 'down'
    return `Your portfolio is valued at ${formatCurrency(total)}, ${direction} ${formatPercent(Math.abs(change))} today.`
  }
  return 'I got that data for you.'
}
```

## Testing

1. Test with ElevenLabs web widget first
2. Add phone number for real call testing
3. Verify tool execution via voice commands
4. Test interrupt handling
5. Check latency (aim for <2s end-to-end)

## Pitfalls

- Don't return markdown in voice responses
- Don't make responses too long (user will interrupt)
- Don't forget to handle background noise
- Don't expose sensitive data in voice (anyone can hear)
- Don't skip authentication on voice endpoints
