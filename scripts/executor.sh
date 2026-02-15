#!/bin/bash
# Euler Combinatorics 执行脚本
# 使用 Ralph Loop 模式持续执行

PROJECT_DIR="/root/.openclaw/workspace/euler-combinatorics"
PROGRESS_FILE="$PROJECT_DIR/progress.json"
CURRENT_BATCH=$(jq -r '.currentBatch' $PROGRESS_FILE)
CURRENT_PROB=$(jq -r '.currentProblem' $PROGRESS_FILE)

echo "=== Euler Combinatorics 执行器 ==="
echo "当前批次: 第$CURRENT_BATCH卷"
echo "当前题目: $CURRENT_PROB"
echo ""

# 检查是否需要启动新批次
if [ $CURRENT_PROB -eq 0 ] && [ $CURRENT_BATCH -eq 1 ]; then
    echo "启动第一批题目 (001-050): 基础计数"
    openclaw agent --agent main --prompt "执行组合数学项目第一批题目。

任务: 生成并解决第001-050道组合数学题目。
主题: 基础计数原理

要求:
1. 每道题包含: 题目编号、题目描述、解答过程、最终答案
2. 使用LaTeX格式输出数学公式
3. 确保题目不重复，难度递进
4. 保存到 euler-combinatorics/book-i/001-050.md

示例题目类型:
- 001-010: 基本计数原理 (加法/乘法原理)
- 011-020: 排列基础
- 021-030: 组合基础  
- 031-040: 重复排列与组合
- 041-050: 基础计数综合题

完成后:
1. 更新 progress.json
2. git commit
3. 发送完成汇报" 2>&1
fi
