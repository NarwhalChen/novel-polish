#!/bin/bash
# 全局安装 novel-polish 到 ~/.claude/commands/
# 用法：./install.sh
# 之后任意项目目录均可使用 /novel-* 命令

COMMANDS_SRC="$(cd "$(dirname "$0")/commands" && pwd)"
COMMANDS_DST="$HOME/.claude/commands"

mkdir -p "$COMMANDS_DST"

count=0
for f in "$COMMANDS_SRC"/*.md; do
  name="$(basename "$f")"
  ln -sf "$f" "$COMMANDS_DST/$name"
  echo "  ✓ $name"
  count=$((count + 1))
done

echo ""
echo "✓ 安装完成（$count 个命令 → $COMMANDS_DST）"
echo "  更新：cd $(dirname "$0") && git pull（symlink 自动生效）"
echo "  使用：进入任意小说目录，运行 /novel-init <标题>"
