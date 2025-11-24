# seekDB Claude Skill Plugin

一个 Claude 技能插件，用于将 OceanBase seekDB 文档引用添加到项目的 AI 文档文件中。让 AI 助手能够访问 seekDB 最佳实践、SQL 语法、Python SDK 模式、向量搜索和混合搜索指南，而无需在项目中存放大量文档文件。

## 📋 项目简介

`seekdb-claude-skill-plugin` 是一个 Claude 插件，提供了 `add-seekdb-docs` 技能，可以自动将 seekDB 文档引用添加到你的项目 AI 配置文件中（如 `CLAUDE.md`、`AGENTS.md` 或 Cursor 规则文件）。这样，AI 助手就能在开发过程中快速访问 seekDB 相关的知识和最佳实践。

## ✨ 功能特性

- 🚀 **自动化安装** - 一键将 seekDB 文档引用添加到项目
- 📚 **多文档集支持** - 支持核心指南、SQL 语法、Python SDK、向量搜索等多种文档集
- 🔗 **引用式集成** - 通过 URL 引用文档，不占用项目空间
- 🎯 **智能检测** - 自动检测项目中的 AI 文档文件（CLAUDE.md、AGENTS.md、.cursor/README.md）
- ⚙️ **灵活配置** - 支持 GitHub、本地文件或其他托管方式的文档 URL
- 🔄 **增量更新** - 支持向现有文档追加引用，不会覆盖已有内容

## 📦 项目结构

```
seekdb-claude-skill-plugin/
├── .claude-plugin/
│   └── marketplace.json          # 插件市场配置
├── seekdb-plugin/
│   ├── plugin.json               # 插件元数据
│   └── skills/
│       └── add-seekdb-docs/      # add-seekdb-docs 技能
│           ├── SKILL.md          # 技能描述和使用说明
│           ├── README.md         # 技能详细文档
│           ├── install-knowledge.md  # 安装工作流
│           ├── skill-knowledge-map.json  # 文档映射配置
│           └── docs/             # 文档文件（可选）
│               ├── QUICKSTART.md
│               ├── README.md
│               ├── seekdb-core.mdc
│               ├── seekdb-sql.mdc
│               ├── seekdb-python-sdk.mdc
│               ├── seekdb-vector-search.mdc
│               ├── seekdb-hybrid-search.mdc
│               ├── seekdb-hybrid-vector-index.mdc
│               └── seekdb-ai-functions.mdc
└── README.md                     # 本文件
```

## 🚀 快速开始

### 前置要求

- Claude Code 或支持 Claude 插件的环境
- 一个使用 seekDB 的项目

### 安装插件

1. **克隆或下载此仓库**

```bash
git clone <repository-url>
cd seekdb-claude-skill-plugin
```

2. **在 Claude Code 中安装插件**

插件会自动从 `.claude-plugin/marketplace.json` 加载。

### 使用技能

#### 方式一：通过技能名称调用

在 Claude Code 中执行：

```
Execute the add-seekdb-docs skill with SKILL_NAME="seekdb-core"
```

#### 方式二：直接请求

在 Claude Code 中直接说：

- "Add seekDB core knowledge to my project"
- "Install seekDB SQL documentation"
- "Set up seekDB best practices for my AI assistant"
- "Add seekDB Python SDK references"

## 📚 可用的文档集

技能支持安装以下文档集的引用：

| 文档集 | 说明 | 适用场景 |
|--------|------|----------|
| `seekdb-core` | 核心指南和概述 | 了解 seekDB 基础概念、部署模式和基本操作 |
| `seekdb-sql` | SQL 语法参考 | 编写 SQL 查询，包括向量、全文、JSON 和混合查询 |
| `seekdb-python-sdk` | Python SDK 指南 | 使用 Python SDK 进行开发（嵌入式和客户端/服务器模式） |
| `seekdb-vector-search` | 向量搜索详解 | 实现向量相似度搜索和嵌入操作 |
| `seekdb-hybrid-search` | 混合搜索模式 | 实现结合向量、全文和关系查询的混合搜索 |
| `seekdb-hybrid-vector-index` | 混合向量索引 | 使用自动将文本转换为向量的语义索引 |
| `seekdb-ai-functions` | AI 函数使用 | 使用内置 AI 功能（嵌入、补全、重排序等） |
| `seekdb-all` | 完整文档集 | 安装所有 seekDB 文档引用 |

## ⚙️ 配置说明

### 更新文档 URL

在使用技能之前，**必须**更新 `skill-knowledge-map.json` 中的 URL，使其指向实际的文档位置。

#### 选项 1: GitHub 仓库

如果你的文档在 GitHub 仓库中：

```json
{
  "seekdb-core": {
    "files": [{
      "url": "https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-core.mdc"
    }]
  }
}
```

#### 选项 2: 本地文件

如果文档在本地：

```json
{
  "seekdb-core": {
    "files": [{
      "url": "./seekdb/seekdb-core.mdc"
    }]
  }
}
```

或使用绝对路径：

```json
{
  "seekdb-core": {
    "files": [{
      "url": "/path/to/seekdb/seekdb-core.mdc"
    }]
  }
}
```

#### 选项 3: 其他托管方式

如果文档托管在其他地方（如 CDN、S3），使用相应的 URL 格式。

## 📝 使用示例

### 示例 1: 添加核心文档

执行技能后，你的 `CLAUDE.md` 文件会包含：

```markdown
## Resources & References

- **Core guidelines, overview, deployment modes, and basic operations for seekDB**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-core.mdc
```

### 示例 2: 添加完整文档集

使用 `seekdb-all` 会添加所有文档引用：

```markdown
## Resources & References

- **Core guidelines and overview**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-core.mdc
- **Complete SQL syntax reference**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-sql.mdc
- **Python SDK usage guide**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-python-sdk.mdc
- **Vector search and similarity operations**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-vector-search.mdc
- **Hybrid search patterns**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-hybrid-search.mdc
- **Built-in AI functions**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-ai-functions.mdc
- **Hybrid vector index (semantic index) that automatically converts text to vectors**: https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-hybrid-vector-index.mdc
```

## 🔧 工作流程

技能执行时会遵循以下流程：

1. **加载元数据** - 从 `skill-knowledge-map.json` 读取技能信息
2. **检测文档文件** - 查找项目中的 `CLAUDE.md`、`AGENTS.md` 或 Cursor 规则文件
3. **请求确认** - 显示将要添加的内容和位置
4. **添加引用** - 在 "Resources & References" 部分插入 URL
5. **报告完成** - 确认安装成功

### 目标文件（优先级顺序）

- `CLAUDE.md` - Claude Code 项目最常用
- `AGENTS.md` - 自定义 AI 文档文件
- `.cursor/README.md` 或 `.cursor/rules.md` - Cursor IDE 项目
- 如果都不存在，会创建 `CLAUDE.md`

### 行为说明

- **已有 "Resources & References" 部分**：新链接会追加到现有部分
- **没有现有部分**：会在文件末尾创建新部分
- **没有文档文件**：会创建 `CLAUDE.md` 并添加引用

## 🛠️ 自定义和扩展

### 添加新的文档集

编辑 `seekdb-plugin/skills/add-seekdb-docs/skill-knowledge-map.json`：

```json
{
  "seekdb-custom": {
    "displayName": "Custom seekDB Documentation",
    "files": [
      {
        "url": "https://example.com/custom.mdc",
        "filename": "custom.mdc",
        "required": true,
        "description": "Custom seekDB documentation"
      }
    ],
    "completionMessage": "Custom documentation added!"
  }
}
```

### 修改工作流

编辑 `seekdb-plugin/skills/add-seekdb-docs/install-knowledge.md` 来自定义安装工作流。

## 🧪 测试

### 测试步骤

1. 确保 `skill-knowledge-map.json` 中的 URL 正确
2. 在测试项目中运行技能
3. 验证引用是否正确添加
4. 检查 AI 助手是否能访问引用的文件

### 测试示例

在添加文档引用后，尝试以下提示：

```
帮我创建一个 seekDB 的表，用于存储文档和向量嵌入
```

AI 应该能够根据引用的文档生成正确的 seekDB SQL 代码。

## ❓ 故障排除

### URL 无法访问

- 验证 `skill-knowledge-map.json` 中的 URL 是否正确
- 检查文件是否公开可访问（对于 GitHub raw URL）
- 对于本地文件，确保路径相对于项目根目录是正确的

### 文件未检测到

- 确保目标文件（CLAUDE.md、AGENTS.md、.cursor/README.md）存在或允许创建
- 检查文件权限

### 引用不工作

- 验证引用的 .mdc 文件是否可访问
- 检查文件格式和内容
- 确保 AI 助手可以访问引用的 URL

## 📖 相关资源

- **seekDB 官方文档**: https://www.oceanbase.ai/docs/
- **seekDB GitHub**: https://github.com/oceanbase/seekdb
- **技能详细文档**: [seekdb-plugin/skills/add-seekdb-docs/README.md](seekdb-plugin/skills/add-seekdb-docs/README.md)
- **快速开始指南**: [seekdb-plugin/skills/add-seekdb-docs/docs/QUICKSTART.md](seekdb-plugin/skills/add-seekdb-docs/docs/QUICKSTART.md)

## 🤝 贡献

欢迎贡献！如果你有改进建议或发现问题，请：

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 开启 Pull Request

## 📄 许可证

本项目采用 [许可证名称] 许可证。详情请参阅 LICENSE 文件。

## 🙏 致谢

- OceanBase seekDB 团队
- Claude 插件社区

---

**注意**: 使用前请确保更新 `skill-knowledge-map.json` 中的 URL 配置，使其指向实际的文档位置。

