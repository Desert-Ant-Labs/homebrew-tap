# Desert Ant Labs tap

Homebrew casks for Desert Ant Labs apps.

```bash
brew tap desert-ant-labs/tap
brew install --cask clipper
```

`brew upgrade --cask clipper` moves to the newest release after that.

Homebrew 6 asks you to approve a tap it does not know before installing from
it. Answering the prompt covers that one cask, and `brew trust
desert-ant-labs/tap` covers everything here, now and later.

## What is here

| cask | what it is |
|---|---|
| `clipper` | [Clipper](https://github.com/Desert-Ant-Labs/demo-clipper), which generates short clips from a video podcast, meeting recording, or longer recording, fully on device |

Apple Silicon and macOS 26 or later. The apps are signed and notarized, and the
disk images come from the releases of the repo each cask names.
