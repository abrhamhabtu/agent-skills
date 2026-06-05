# Voice Agent Integration (Quick Reference)

## ElevenLabs Quick Setup

1. **Account**: elevenlabs.io → Sign up → API keys
2. **Agent**: Dashboard → Conversational AI → Create Agent
3. **Voice**: Select model (Turbo v2.5 for lowest latency)
4. **Deploy**: Web widget / Phone / API

## Integration Patterns

| Pattern | Latency | Complexity | Best For |
|---------|---------|------------|----------|
| Native ElevenAgents | Low | Low | Quick deploy |
| Hybrid (ElevenLabs STT/TTS + Hermes logic) | Medium | Medium | Custom tools |
| Self-hosted (Whisper + Piper) | High | High | Privacy/offline |

## Hermes Bridge Endpoint

```
POST http://localhost:8787/api/chat
Content-Type: application/json

{
  "message": "user speech transcript",
  "context": { "channel": "voice", "session_id": "..." }
}
```

## Key Configs

- **Interrupt handling**: Enable barge-in
- **Silence timeout**: 3-5 seconds
- **Max duration**: 10 minutes per call
- **Fallback**: Text SMS if voice fails
