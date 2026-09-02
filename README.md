# Desert Ant Labs tap

Homebrew casks and formulas for Desert Ant Labs apps and tools.

```bash
brew tap desert-ant-labs/tap
brew install --cask clipper
brew install desertant
```

`brew upgrade --cask clipper` moves to the newest release after that.

Homebrew 6 asks you to approve a tap it does not know before installing from
it. Answering the prompt covers that one cask, and `brew trust
desert-ant-labs/tap` covers everything here, now and later.

## What is here

| cask | what it is |
|---|---|
| `desertant` | [desertant](https://github.com/Desert-Ant-Labs/desert-ant-cli), the Desert Ant CLI: run the models from the terminal, on macOS and Linux |
| `clipper` | [Clipper](https://github.com/Desert-Ant-Labs/demo-clipper), which generates short clips from a video podcast, meeting recording, or longer recording, fully on device |

Apple Silicon and macOS 26 or later. The apps are signed and notarized, and the
disk images come from the releases of the repo each cask names.
