---
description: Phase 5：终校，只找错别字和排版问题
allowed-tools: Read, Bash
argument-hint: [--mark-done]
---

## Phase 检查

读取 `.novel/state.json`。若不存在，停止：`✗ 请先运行 /novel-init`

**前置检查：**
`copy-edit.status` 必须是 `done`，否则停止：
`✗ BLOCKED：请先完成 Phase 4 文字校稿（/novel-copy-edit --mark-done）`

**若 `proofread.status` 已是 `done`：**
恭喜用户完稿，显示整个流程完成时间线，停止。

## 参数处理

**若参数为 `--mark-done`：**
更新 state.json：`proofread.status = "done"`，`proofread.completed_at = <今天>`

输出完稿庆祝信息：
```
● 终校完成。《<title>》全部打磨阶段已完成。

完稿时间线：
  Phase 0 扩充：   <completed_at 或 skipped>
  Phase 1 冷读：   <completed_at>
  Phase 2 发展性：  <completed_at>
  Phase 3 行文：   <completed_at>（共 <iteration> 轮）
  Phase 4 文字：   <completed_at>
  Phase 5 终校：   <今天>

这稿子已经被你认真对待过了。可以投稿了。
```
停止。

## 执行（无参数）

将 `proofread.status` 更新为 `in_progress`。

读取 `chapters/` 下所有 `.md` 文件。

**终校只做一件事：找错。不做分析，不做建议，只列出需要改的地方。**

### 检查项

1. **错别字**：形近字（己/已/巳，戊/戌/戍，黏/粘）、同音字（的/得/地滥用，再/在混用）

2. **多字/漏字**：句子中明显多出或缺少的字（通常因为改稿时手误）

3. **重复词**：相邻两句中同一个词重复出现且非有意为之（"他走进走进了房间"）

4. **数字格式**：全稿数字写法是否一致（汉字数字 vs 阿拉伯数字）

5. **空格与排版**：中文字符与英文/数字之间是否有不必要的空格，或应有空格而没有

6. **章节标题格式**：各章标题格式是否一致

---

输出格式（极简，每行一个问题）：

```
《<title>》终校清单
Phase 5 · <今天日期>
共检查 N 章，约 X 字

[章节] 第 N 行：[原文片段] → [问题类型]：[说明]

示例：
[ch03.md] 第 47 行："他走进走进了" → 重复字：删除一个"走进"
[ch05.md] 第 102 行："己经" → 错别字：应为"已经"
[ch07.md] 第 23 行："2个人" → 数字格式：建议统一为"两个人"

共发现 N 处（错别字 N，多/漏字 N，重复 N，数字 N，其他 N）
```

**不要改动任何正文文件。**

修改完成后运行：`/novel-proofread --mark-done`
