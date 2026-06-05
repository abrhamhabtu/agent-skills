# Hermes Voice Bridge (Quick Reference)

## Quick Setup

1. **ElevenLabs**: Create agent → Set Custom LLM → Point to Hermes API
2. **Hermes**: Create `/api/voice-chat` endpoint
3. **Phone**: Twilio/Vonage → ElevenLabs WebSocket

## Endpoint

```typescript
POST /api/voice-chat
{
  "message": "transcribed speech",
  "session_id": "call-123",
  "context": { "user_id": "...", "channel": "voice" }
}
```

## Response Rules

- Max 30 words per response
- No markdown, no code blocks
- Spell out numbers and acronyms
- Use natural pauses

## Tool Execution

Voice agents can use all Hermes tools:
- File operations
- Web search
- Code execution
- API calls

## Testing

1. Web widget (fastest)
2. Phone call (real world)
3. Verify tool execution
4. Test interrupts
