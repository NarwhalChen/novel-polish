---
description: Phase 1：冷读评估，通读全稿写编辑信
allowed-tools: Read, Bash
argument-hint: [--mark-done]
---

## Phase 检查

读取 `.novel/state.json`。若不存在，停止：`✗ 请先运行 /novel-init`

**前置检查：**
`expand.status` 必须是 `done` 或 `skipped`，否则停止：
`✗ BLOCKED：请先完成或跳过 Phase 0 扩充（/novel-expand 或 /novel-expand --skip）`

**冷却期检查：**
计算 `last_major_change` 到今天的天数。
若天数 < `phases.cold-read.cooldown_days`（默认 3）：
`⚠ 建议再等 <剩余> 天（让大脑忘掉细节，才能看到真正的问题）。强制继续请加 --force`
除非参数包含 `--force`，否则停止。

**若 `cold-read.status` 已是 `done`：**
显示完成时间，询问是否重新运行。若无 `--rerun` 参数则停止。

## 参数处理

**若参数为 `--mark-done`：**
更新 state.json：`cold-read.status = "done"`，`cold-read.completed_at = <今天>`
输出：`● 冷读评估标记完成。运行 /novel-dev-edit 进入发展性编辑。`
停止。

## 执行（无参数或含 --force）

将 `cold-read.status` 更新为 `in_progress`。

读取 `chapters/` 下所有 `.md` 文件，按顺序通读全稿。

以职业编辑视角写一封编辑信，结构如下：

---

```
致作者的编辑信
《<title>》冷读评估 · <今天日期>

【第一印象】
用 2-3 句话描述整体感受。这篇稿子的气质是什么？它想做什么，做到了吗？

【最有力的地方】
具体列出 3-5 处真正出彩的段落或场景（引用原文，说明为什么有力）。
这部分的目的是帮作者识别需要保护的东西。

【核心问题（按优先级）】
P1 级（影响全篇成立的问题）：
- [问题描述，引用具体位置]

P2 级（影响阅读体验的问题）：
- [问题描述，引用具体位置]

P3 级（可以更好但不影响大局）：
- [问题描述]

【人物】
青辉/主要人物的弧光是否完整？情感逻辑是否自洽？
具体指出哪个时刻最可信，哪个时刻最可疑。

【结构节奏】
全稿的节奏图：哪里张、哪里弛、哪里该停没停、哪里该走没走。

【主题与气质】
这篇想说什么？说清楚了吗？有没有主题被削弱或自相矛盾的地方？

【给作者的一句话】
用一句话总结这稿子现在最需要做的一件事。
```

---

**不要改动任何正文文件。只输出编辑信。**

完成通读后运行：`/novel-cold-read --mark-done`
