---
name: universal-voice-agent-integration
description: Integrate voice capabilities into AI agents using ElevenLabs, Twilio, and WebRTC. Use when building phone-accessible AI agents, voice UIs, or telephony integrations.
triggers:
  - voice
  - elevenlabs
  - telephony
  - phone
  - twilio
  - webrtc
  - speech-to-text
  - text-to-speech
  - conversational-ai
agent: universal
---

# Voice Agent Integration

## When to Use

When you need to add voice interaction capabilities to an AI agent. This includes phone-based agents, voice-enabled web interfaces, and hands-free mobile experiences.

## Architecture Options

### Option 1: ElevenLabs Native (Fastest)
- Use ElevenAgents dashboard for configuration
- Deploy via web widget, phone number, or API
- Best for: Quick deployment, managed infrastructure

### Option 2: Hybrid (Recommended for Hermes)
- ElevenLabs handles STT/TTS layer
- Your agent (Hermes) handles logic/tool execution
- Connect via WebSocket or Server-Sent Events
- Best for: Custom logic, existing agent infrastructure

### Option 3: Fully Self-Hosted
- Local STT (Whisper) + TTS (Piper/Coqui) + LLM
- No external API dependencies
- Best for: Privacy-critical, offline scenarios

## ElevenLabs Integration Steps

1. **Create an ElevenLabs account** at elevenlabs.io
2. **Get API key** from dashboard settings
3. **Choose integration method:**
   - Web widget (embeddable iframe)
   - Phone (Twilio/Vonage/Telnyx)
   - Server (WebSocket API)
   - Mobile (iOS/Android SDK)

4. **Configure agent behavior:**
   - System prompt (personality, capabilities)
   - Knowledge base (RAG documents)
   - Tools (function calling)
   - Voice settings (model, stability, clarity)

5. **Connect to your backend:**
   - Use Custom LLM option to route to Hermes API
   - Or use ElevenLabs native LLM with webhooks to your tools

## WebSocket Integration (Hermes)

```typescript
// Connect to ElevenLabs Conversational AI WebSocket
const ws = new WebSocket(
  'wss://api.elevenlabs.io/v1/convai/conversation?agent_id=YOUR_AGENT_ID'
);

ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  
  if (data.type === 'user_transcript') {
    // Send to Hermes for processing
    fetch('http://localhost:8787/api/chat', {
      method: 'POST',
      body: JSON.stringify({ message: data.text })
    })
    .then(res => res.json())
    .then(response => {
      // Send response back to ElevenLabs
      ws.send(JSON.stringify({
        type: 'agent_response',
        text: response.text
      }));
    });
  }
};
```

## Phone Integration (Twilio)

```typescript
// Twilio webhook handler
app.post('/voice', (req, res) => {
  const twiml = new VoiceResponse();
  
  // Stream audio to ElevenLabs
  const connect = twiml.connect();
  connect.stream({
    url: 'wss://api.elevenlabs.io/v1/convai/twilio/YOUR_AGENT_ID'
  });
  
  res.type('text/xml');
  res.send(twiml.toString());
});
```

## Pitfalls

- Don't underestimate latency: aim for <500ms response time
- Don't forget voicemail detection for outbound calls
- Always handle interrupt scenarios (barge-in)
- Test with real phone lines, not just web audio
- Consider noise cancellation for real-world environments

## Testing

1. Test with various accents and speech patterns
2. Verify interrupt handling works smoothly
3. Check fallback behavior when LLM is slow
4. Monitor cost per conversation
5. Log all conversations for quality review
