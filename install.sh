#!/bin/bash
# 全局安装 novel-polish 到 ~/.claude/skills/
# 用法：git clone <repo> ~/.claude/skills/novel-polish && cd ~/.claude/skills/novel-polish && ./install.sh
# 之后任意项目目录均可使用 /novel-* 命令

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$(dirname "$REPO_DIR")"

count=0
for skill_dir in "$REPO_DIR"/novel-*/; do
  name="$(basename "$skill_dir")"
  target="$SKILLS_DIR/$name"

  if [ -L "$target" ]; then
    rm "$target"
  elif [ -d "$target" ]; then
    echo "  ✗ $name 已存在且不是软链接，跳过"
    continue
  fi

  ln -s "$skill_dir" "$target"
  echo "  ✓ $name → $target"
  count=$((count + 1))
done

echo ""
echo "✓ 安装完成（$count 个 skill）"
echo "  更新：cd $REPO_DIR && git pull（symlink 自动生效）"
echo "  使用：进入任意小说目录，运行 /novel-init <标题>"
