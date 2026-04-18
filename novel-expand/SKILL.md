---
description: Phase 0（可选）：扩充阶段，分析各章节扩写空间
allowed-tools: Read, Bash
argument-hint: [--skip | --mark-done]
---

## Phase 检查

读取 `.novel/state.json`。若不存在，停止：`✗ 请先运行 /novel-init`

检查 `phases.expand.status`：
- `done` 或 `skipped` → 告知已完成，停止
- `in_progress` 或 `not_started` → 继续

## 参数处理

**若参数为 `--skip`：**
更新 state.json：`expand.status = "skipped"`，`expand.skipped_at = <今天>`
输出：`- 扩充阶段已跳过。运行 /novel-cold-read 继续。`
停止。

**若参数为 `--mark-done`：**
更新 state.json：`expand.status = "done"`，`expand.completed_at = <今天>`，`last_major_change = <今天>`
输出：`● 扩充阶段标记完成。运行 /novel-cold-read 继续（建议先冷却 3 天）。`
停止。

## 执行分析（无参数）

将 `expand.status` 更新为 `in_progress`。

读取 `chapters/` 下所有 `.md` 文件，按文件名排序。

对每个章节，分析以下维度并给出具体建议：

### 1. 场景密度
哪些场景一笔带过、但情感或信息密度值得展开？给出具体段落引用和扩写方向。

### 2. 感官缺失
哪些场景只有对话/动作，缺少环境、气味、温度、声音？列出具体位置。

### 3. 人物内心
哪些关键时刻人物反应是外显的（行动/对话），但内心活动缺席？

### 4. 过渡空白
章节之间、场景切换处，哪些跳跃太硬？可以用什么内容填充？

### 5. 字数估算
当前章节字数 vs 建议扩充后字数。

---

输出格式：

```
《<title>》扩充分析

当前总字数：约 X 字
建议扩充至：约 Y 字

--- 第 N 章：<章节名> ---
当前：约 X 字 → 建议：约 Y 字

▸ 场景密度：[具体段落] → [扩写建议]
▸ 感官缺失：[具体位置] → [补充方向]
▸ 人物内心：[具体时刻] → [可挖掘的心理层次]
▸ 过渡空白：[具体位置] → [建议内容]

...（每章依次）

完成扩充后运行：/novel-expand --mark-done
跳过此阶段运行：/novel-expand --skip
```

**不要改动任何正文文件。只输出分析建议。**
