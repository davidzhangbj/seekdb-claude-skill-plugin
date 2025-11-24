# seekDB AI Rules for Cursor and Claude Code

This directory contains AI context rules for [OceanBase seekDB](https://www.oceanbase.ai/docs/), an AI-native search database that unifies relational, vector, text, JSON and GIS in a single engine.

## What is seekDB?

OceanBase seekDB is an AI-native search database that:
- **Unifies multiple data models**: relational, vector, text, JSON, and GIS in a single engine
- **Enables hybrid search**: combines vector search, full-text search, and relational queries
- **Provides AI functions**: built-in embedding generation, text completion, and reranking
- **MySQL compatible**: fully compatible with MySQL 8.0+ syntax and drivers
- **Supports embedded mode**: can be embedded directly into Python applications

## Files Overview

### Core Documentation

- **`seekdb-core.mdc`** - Core guidelines, overview, deployment modes, and basic operations
- **`seekdb-sql.mdc`** - Complete SQL syntax reference including vector, full-text, JSON, and hybrid queries
- **`seekdb-python-sdk.mdc`** - Python SDK usage guide for embedded and client/server modes

### Specialized Features

- **`seekdb-vector-search.mdc`** - Vector search, similarity search, and embedding operations
- **`seekdb-hybrid-search.mdc`** - Hybrid search combining multiple search modalities
- **`seekdb-hybrid-vector-index.mdc`** - Hybrid vector index (semantic index) that automatically converts text to vectors
- **`seekdb-ai-functions.mdc`** - Built-in AI functions for embedding, completion, and reranking

## Quick Start

### For Cursor IDE

1. **Copy files to Cursor rules directory:**

```bash
# Create rules directory if it doesn't exist
mkdir -p .cursor/rules

# Copy all seekDB rules
cp docs/*.mdc .cursor/rules/

# Or copy specific files you need
cp docs/seekdb-core.mdc .cursor/rules/
cp docs/seekdb-sql.mdc .cursor/rules/
cp docs/seekdb-python-sdk.mdc .cursor/rules/
```

2. **Start using in Cursor:**

Cursor will automatically apply these rules when you:
- Write SQL queries
- Work with Python files
- Ask questions about seekDB

### For Claude Code

1. **Add references to CLAUDE.md:**

```markdown
## Resources & References

- **seekDB Core Guidelines**: [path to seekdb-core.mdc]
- **seekDB SQL Reference**: [path to seekdb-sql.mdc]
- **seekDB Python SDK**: [path to seekdb-python-sdk.mdc]
- **seekDB Official Docs**: https://www.oceanbase.ai/docs/
- **seekDB GitHub**: https://github.com/oceanbase/seekdb
```

2. **Or create .cursor/README.md:**

```bash
mkdir -p .cursor
cat > .cursor/README.md << 'EOF'
# Project AI Documentation

## Resources & References

- **seekDB Documentation**: https://www.oceanbase.ai/docs/
- **seekDB Core Rules**: [local path to seekdb-core.mdc]
EOF
```

## Usage Examples

### Example 1: Generate seekDB SQL

**Prompt to Cursor/Claude:**
```
Create a seekDB table for storing document embeddings with vector search capability
```

**AI will generate:**
```sql
CREATE TABLE documents (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT,
    embedding VECTOR(1536),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FULLTEXT INDEX idx_content (content),
    INDEX idx_embedding USING VECTOR(embedding) 
        WITH (type='HNSW', m=16, ef_construction=200)
);
```

### Example 2: Python SDK Code

**Prompt:**
```
Write Python code to connect to seekDB and perform a vector similarity search
```

**AI will generate:**
```python
from seekdb import SeekDBClient
import numpy as np
import os

client = SeekDBClient(connection_string=os.getenv('SEEKDB_URL'))

query_embedding = np.random.rand(1536).astype(np.float32).tolist()

results = client.query("""
    SELECT 
        id,
        content,
        VECTOR_DISTANCE(embedding, ?) as similarity
    FROM documents
    WHERE VECTOR_DISTANCE(embedding, ?) > 0.7
    ORDER BY similarity DESC
    LIMIT 10
""", [query_embedding, query_embedding])
```

### Example 3: Ask Questions

**Prompt:**
```
How do I implement hybrid search in seekDB?
```

**AI will provide:**
- Explanation of hybrid search
- SQL examples combining vector and full-text search
- Python code examples
- Best practices

## File Descriptions

### seekdb-core.mdc

Core guidelines covering:
- Overview and key capabilities
- Deployment modes (embedded vs client/server)
- Connection setup
- Basic operations
- Best practices
- Common patterns

**Use when:** Getting started with seekDB, understanding basic concepts

### seekdb-sql.mdc

Complete SQL reference including:
- Standard SQL operations (DDL, DML, joins)
- Vector operations and indexes
- Full-text search syntax
- Hybrid search queries
- JSON operations
- AI functions in SQL
- Transactions

**Use when:** Writing SQL queries, need syntax reference

### seekdb-python-sdk.mdc

Python SDK guide covering:
- Installation
- Embedded and client/server modes
- Basic operations
- Vector operations
- Full-text search
- Hybrid search
- AI functions
- Connection pooling
- Error handling
- Complete RAG example

**Use when:** Writing Python code with seekDB

### seekdb-vector-search.mdc

Vector search deep dive:
- Vector data types and dimensions
- Index types (HNSW, IVF, quantization)
- Distance metrics (cosine, euclidean, inner product, manhattan)
- Search patterns
- Python vector operations
- Performance optimization
- Common use cases

**Use when:** Implementing vector similarity search

### seekdb-hybrid-search.mdc

Hybrid search patterns:
- Why hybrid search
- Basic and advanced patterns
- Reciprocal Rank Fusion (RRF)
- Weighted score fusion
- Relational filters
- Python implementations
- RAG workflows
- Best practices

**Use when:** Implementing hybrid search combining multiple modalities

### seekdb-hybrid-vector-index.mdc

Hybrid vector index (semantic index) guide:
- Overview and key benefits
- Automatic text-to-vector conversion
- Creating hybrid vector indexes
- Querying with semantic indexes
- Python SDK usage
- Performance optimization
- Best practices

**Use when:** Using semantic indexes that automatically convert text to vectors without manual embedding

### seekdb-ai-functions.mdc

AI functions guide:
- Service management (DBMS_AI_SERVICE)
- Embedding generation (AI_EMBED)
- Text completion (AI_COMPLETE)
- Reranking (AI_RERANK)
- Advanced patterns
- Complete RAG examples
- Best practices

**Use when:** Using built-in AI functions for embeddings, completion, reranking

## Best Practices

1. **Start with core.mdc** - Understand the basics first
2. **Use specific files** - Reference specialized files for specific features
3. **Keep files updated** - Update rules as seekDB evolves
4. **Combine with official docs** - Use these rules alongside official documentation

## Resources

- **Official Documentation**: https://www.oceanbase.ai/docs/
- **GitHub Repository**: https://github.com/oceanbase/seekdb
- **Getting Started Guide**: See official documentation
- **API Reference**: Check official documentation

## Contributing

If you find issues or want to improve these rules:
1. Review the official seekDB documentation
2. Test the examples in your environment
3. Update the relevant .mdc files
4. Ensure examples are accurate and up-to-date

## License

These rules are provided as-is for use with Cursor and Claude Code. Refer to seekDB's license (Apache 2.0) for database usage terms.

