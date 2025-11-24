# seekDB AI Rules - Quick Start Guide

## 快速开始

### 在 Cursor 中使用

1. **复制文件到 Cursor 规则目录：**

```bash
# 在项目根目录执行
mkdir -p .cursor/rules
cp docs/*.mdc .cursor/rules/
```

2. **验证安装：**

在 Cursor 中创建一个新的 SQL 或 Python 文件，然后尝试：

```
帮我创建一个 seekDB 的表，用于存储文档和向量嵌入
```

Cursor 应该能够根据规则文件生成正确的 seekDB SQL 代码。

### 在 Claude Code 中使用

1. **添加到 CLAUDE.md：**

在项目根目录的 `CLAUDE.md` 文件中添加：

```markdown
## Resources & References

- **seekDB Core Guidelines**: ./seekdb/seekdb-core.mdc
- **seekDB SQL Reference**: ./seekdb/seekdb-sql.mdc
- **seekDB Python SDK**: ./seekdb/seekdb-python-sdk.mdc
- **seekDB Official Documentation**: https://www.oceanbase.ai/docs/
```

2. **或者创建 .cursor/README.md：**

```bash
mkdir -p .cursor
cat > .cursor/README.md << 'EOF'
# Project AI Documentation

## Resources & References

- **seekDB Documentation**: https://www.oceanbase.ai/docs/
- **seekDB GitHub**: https://github.com/oceanbase/seekdb
EOF
```

## 测试效果

### 测试 1: SQL 生成

**提示：**
```
创建一个 seekDB 表，包含向量列和全文索引
```

**预期结果：** AI 应该生成包含 `VECTOR(1536)` 列和 `FULLTEXT INDEX` 的 SQL。

### 测试 2: Python 代码生成

**提示：**
```
写一个 Python 函数，连接到 seekDB 并执行向量相似度搜索
```

**预期结果：** AI 应该生成使用 `SeekDBClient` 和 `VECTOR_DISTANCE` 的代码。

### 测试 3: 问题回答

**提示：**
```
如何在 seekDB 中实现混合搜索？
```

**预期结果：** AI 应该解释混合搜索的概念，并提供 SQL 和 Python 示例。

## 文件说明

| 文件 | 用途 | 何时使用 |
|------|------|----------|
| `seekdb-core.mdc` | 核心指南和概述 | 了解 seekDB 基础 |
| `seekdb-sql.mdc` | SQL 语法参考 | 编写 SQL 查询 |
| `seekdb-python-sdk.mdc` | Python SDK 指南 | 编写 Python 代码 |
| `seekdb-vector-search.mdc` | 向量搜索详解 | 实现向量相似度搜索 |
| `seekdb-hybrid-search.mdc` | 混合搜索模式 | 实现混合搜索 |
| `seekdb-hybrid-vector-index.mdc` | 混合向量索引（语义索引） | 使用自动文本转向量的语义索引 |
| `seekdb-ai-functions.mdc` | AI 函数使用 | 使用内置 AI 功能 |

## 常见问题

### Q: 文件应该放在哪里？

**A:** 
- **Cursor**: `.cursor/rules/` 目录
- **Claude Code**: 项目根目录，然后在 `CLAUDE.md` 中引用

### Q: 需要复制所有文件吗？

**A:** 不需要。你可以只复制你需要的文件：
- 基础使用：`seekdb-core.mdc`, `seekdb-sql.mdc`
- Python 开发：`seekdb-python-sdk.mdc`
- 向量搜索：`seekdb-vector-search.mdc`
- 混合搜索：`seekdb-hybrid-search.mdc`
- 语义索引：`seekdb-hybrid-vector-index.mdc`

### Q: 如何更新规则？

**A:** 直接编辑 `.mdc` 文件，Cursor/Claude Code 会自动读取更新后的内容。

### Q: 规则不生效怎么办？

**A:** 
1. 确认文件在正确的位置（`.cursor/rules/` 或项目根目录）
2. 检查文件扩展名是 `.mdc`
3. 重启 Cursor/Claude Code
4. 检查文件头部元数据格式是否正确

## 下一步

1. 阅读 `README.md` 了解详细说明
2. 查看官方文档：https://www.oceanbase.ai/docs/
3. 尝试不同的提示，测试 AI 的理解能力
4. 根据需要自定义规则文件

## 支持

- **官方文档**: https://www.oceanbase.ai/docs/
- **GitHub**: https://github.com/oceanbase/seekdb
- **问题反馈**: 在 GitHub 上提交 issue

