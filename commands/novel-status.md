---
description: 查看小说打磨当前进度和各 phase 状态
allowed-tools: Read, Bash
---

## 状态检查

读取 `.novel/state.json`。

如果文件不存在，输出：
```
✗ 未初始化。运行 /novel-init <小说标题> 开始。
```
然后停止。

## 输出格式

用以下格式展示状态：

```
《<title>》 打磨进度
创建于：<created_at>  上次大改：<last_major_change>

Phase    名称          状态           备注
──────────────────────────────────────────────────
  0*     扩充          <状态>         可选
  1      冷读评估      <状态>         冷却需 <cooldown_days> 天
  2      发展性编辑    <状态>
  3      行文编辑      <状态>         第 <iteration> 轮
  4      文字校稿      <状态>
  5      终校          <状态>
```

状态显示规则：
- `not_started` → `○ 未开始`
- `in_progress`  → `◐ 进行中`
- `done`         → `● 已完成  <completed_at>`
- `skipped`      → `- 已跳过`
- `blocked`      → `✗ 待解锁`（前置未完成时显示）

## 冷却期检查

对于 `cold-read` phase：如果前一个 phase（expand 或初始化）完成，计算 `last_major_change` 到今天的天数。

如果天数 < `cooldown_days`，在备注栏显示：`还需冷却 <剩余天数> 天`

## 下一步提示

在状态表下方输出一行：

```
▶ 下一步：/novel-<当前可执行的 phase>
```

逻辑：找第一个 `not_started` 且前置已满足的 phase。若有冷却期未满，显示冷却剩余天数而非命令。
