# seekdb Claude Skill Plugin

一个 Claude 技能插件，用于将 OceanBase seekdb 文档引用添加到项目的 AI 文档文件中。让 AI 助手能够访问 seekdb 最佳实践、SQL 语法、Python SDK 模式、向量搜索和混合搜索指南，而无需在项目中存放大量文档文件。

## 📋 项目简介

`seekdb-claude-skill-plugin` 是一个 Claude 插件，提供了 `add-seekdb-docs` 技能，可以自动将 seekdb 文档引用添加到你的项目 AI 配置文件中（如 `CLAUDE.md`、`AGENTS.md` 或 Cursor 规则文件）。这样，AI 助手就能在开发过程中快速访问 seekdb 相关的知识和最佳实践。

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
├── seekdb-plugin/                # Claude Code 插件
│   ├── .claude-plugin/
│   │   └── plugin.json           # 插件配置
│   └── skills/                   # 技能目录
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

- 已安装 Claude Code
- 一个使用 seekDB 的项目

### Claude Code 用户

**1. 增加 seekDB 的 marketplace ：**

```bash
/plugin marketplace add davidzhangbj/seekdb-claude-skill-plugin
```

**2. 在 Claude Code 中安装插件：**
```bash
/plugin install seekdb-plugin@seekdb-marketplace
```


**3. 验证安装：**

询问 Claude Code："你有哪些可用的技能？"

你应该能看到 `add-seekdb-docs` 技能。

**4. 开始使用：**

使用自然语言，技能会自动激活：

```bash
> 为我的项目添加 seekDB 核心文档
> 安装 seekDB SQL 语法文档
> 使用 add-seekdb-docs 技能添加 seekdb-core 文档集
```

### Cursor 用户

**1. Clone 仓库：**

首先需要 clone 本仓库到本地：

```bash
git clone https://github.com/davidzhangbj/seekdb-claude-skill-plugin.git
cd seekdb-claude-skill-plugin
```

**2. 创建规则目录：**

在你的项目目录中创建规则目录：

```bash
mkdir -p .cursor/rules
```

**3. 复制所需的 `.mdc` 文件：**

从 clone 的仓库中复制所需的文档文件到你的项目：

```bash
# 示例：复制核心文档和 SQL 语法文档
cp seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-core.mdc .cursor/rules/
cp seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-sql.mdc .cursor/rules/
```

**4. 开始编码：**

Cursor 会在你引用 seekDB 时自动应用这些规则。

### 其他 AI 工具

将 `.mdc` 文件复制到你的 AI 工具的自定义规则目录。该格式是工具无关的，适用于任何支持上下文规则的 AI 助手。

## 📚 技能参考

<details>
<summary><strong>Add seekDB Docs</strong> - 安装文档引用</summary>

将 seekDB 最佳实践添加到项目的 AI 配置文件中：

- CLAUDE.md
- AGENTS.md
- Cursor 规则文件

**可用的文档集：**

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

**使用示例：**

```bash
# 通过技能名称调用
Execute the add-seekdb-docs skill with SKILL_NAME="seekdb-core"

# 或直接请求
Add seekDB core knowledge to my project
Install seekDB SQL documentation
Set up seekDB best practices for my AI assistant
Add seekDB Python SDK references
```

</details>


## 📝 使用示例

### 示例 1: 添加核心文档

执行技能后，你的 `CLAUDE.md` 文件会包含：

```markdown
## Resources & References

- **Core guidelines, overview, deployment modes, and basic operations for seekDB**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-core.mdc
```

### 示例 2: 添加完整文档集

使用 `seekdb-all` 会添加所有文档引用：

```markdown
## Resources & References

- **Core guidelines and overview**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-core.mdc
- **Complete SQL syntax reference**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-sql.mdc
- **Python SDK usage guide**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-python-sdk.mdc
- **Vector search and similarity operations**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-vector-search.mdc
- **Hybrid search patterns**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-hybrid-search.mdc
- **Built-in AI functions**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-ai-functions.mdc
- **Hybrid vector index (semantic index) that automatically converts text to vectors**: ~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-hybrid-vector-index.mdc
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
        "url": "~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/custom.mdc",
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

## ❓ 常见问题

**什么是 .mdc 文件？**

Markdown Context 文件，为 AI 工具提供指导。它们包含最佳实践和模式，AI 助手在生成代码时会自动应用。

**我可以只使用特定规则而不安装完整插件吗？**

可以！将单个 `.mdc` 文件复制到你的 AI 工具规则目录。每个文件都是自包含的，不需要依赖项。

**如何添加或更新规则？**

创建新的 `.mdc` 文件或编辑现有文件。AI 工具会自动使用更新后的内容。

**技能可以在 Cursor 中使用吗？**

技能是 Claude Code 特定的。对于 Cursor，请使用 `.mdc` 上下文规则文件。

**我可以在 ChatGPT 或其他 AI 工具中使用这些规则吗？**

可以！`.mdc` 文件适用于任何支持自定义上下文规则的 AI 助手。将它们复制到工具的配置目录。

**如何验证技能是否正常工作？**

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

