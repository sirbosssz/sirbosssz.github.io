# Vanilla JS — reference

Sources: [frontendpatterns PE](https://frontendpatterns.dev/guides/building-with-progressive-enhancement), [Grizzly Peak PE](https://www.grizzlypeaksoftware.com/library/progressive-enhancement-for-web-applications-0kv3njr2)

## Enhancement layers

| Layer | Must work without JS? |
|-------|----------------------|
| HTML | Yes — links, forms, content |
| CSS | Yes — layout, readability |
| JS | Enhances only — nav toggle, animations |

## Feature detection

```javascript
if ('IntersectionObserver' in window) { /* enhance */ }
if ('fetch' in window) { /* enhance */ }
```

Never use user-agent sniffing.

## Event delegation

```javascript
parent.addEventListener('click', (e) => {
  if (e.target.matches('.btn')) { /* handle */ }
});
```

## Fail silent

```javascript
(function init() {
  const el = document.querySelector('.nav');
  if (!el) return;
  try { /* setup */ } catch { /* noop */ }
})();
```

## Security

- Avoid `innerHTML` with user content
- Use `textContent` for text updates

## Testing

Disable JS in browser → all critical paths still work.
