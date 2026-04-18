---
description: 初始化小说打磨项目，创建 .novel/state.json
allowed-tools: Read, Write, Bash
argument-hint: [小说标题]
---

## 初始化

检查当前目录是否已有 `.novel/state.json`。

如果已存在，告知用户项目已初始化，显示当前状态，停止。

如果不存在：

1. 创建 `.novel/` 目录
2. 用以下结构创建 `.novel/state.json`：

```json
{
  "title": "$ARGUMENTS",
  "created_at": "<今天日期 ISO 格式>",
  "last_major_change": "<今天日期>",
  "phases": {
    "expand": {
      "status": "not_started",
      "optional": true
    },
    "cold-read": {
      "status": "not_started",
      "cooldown_days": 3
    },
    "dev-edit": {
      "status": "not_started"
    },
    "line-edit": {
      "status": "not_started",
      "iteration": 0
    },
    "copy-edit": {
      "status": "not_started"
    },
    "proofread": {
      "status": "not_started"
    }
  }
}
```

3. 检查 `.gitignore` 是否存在，若存在则检查是否包含 `.novel/state.json`，若不包含则追加。若不存在则创建并写入 `.novel/state.json`。

4. 检查 `chapters/` 目录是否存在，若不存在则创建。

完成后输出：
```
✓ 初始化完成：<标题>
  状态文件：.novel/state.json
  下一步：将章节文件放入 chapters/ 目录，然后运行 /novel-status
```
