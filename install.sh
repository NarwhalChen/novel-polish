#!/bin/bash
# 将 novel-polish commands 链接到目标小说项目
# 用法：./install.sh /path/to/my-novel

NOVEL_DIR="${1:-.}"
COMMANDS_SRC="$(cd "$(dirname "$0")/commands" && pwd)"
COMMANDS_DST="$NOVEL_DIR/.claude/commands"

if [ ! -d "$NOVEL_DIR" ]; then
  echo "✗ 目录不存在：$NOVEL_DIR"
  exit 1
fi

mkdir -p "$NOVEL_DIR/.claude"

if [ -L "$COMMANDS_DST" ]; then
  echo "⚠ 已有 symlink：$COMMANDS_DST，覆盖..."
  rm "$COMMANDS_DST"
fi

ln -sf "$COMMANDS_SRC" "$COMMANDS_DST"
echo "✓ 已链接：$COMMANDS_DST → $COMMANDS_SRC"
echo "  进入小说目录运行 /novel-init <标题> 开始"
