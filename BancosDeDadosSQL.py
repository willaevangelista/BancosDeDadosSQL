import pandas as pd
import sqlite3

# Conectar ao banco de dados
conn = sqlite3.connect('banco_alunos.db')
cursor = conn.cursor()

# Criar tabela "alunos"
cursor.execute('''
CREATE TABLE IF NOT EXISTS alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER,
    curso TEXT
)
''')

conn.commit()

# Inserir registros na tabela
alunos_data = [
    (1, "Bianca", 27, "Análise de Dados"),
    (2, "Ana", 33, "Programação em Java"),
    (3, "Esther", 24, "Desenvolvimento de Software"),
    (4, "Larissa", 43, "Ciência da Computação"),
    (5, "Clara", 21, "Desenvolvimento de Sistemas"),
    (6, "Bruna", 38, "Engenharia da Computação"),
    (7, "Luana", 29, "Engenharia de Programação"),
    (8, "Zara", 25, "Engenharia de Sistemas"),
    (9, "Seleste", 18, "Engenharia de Dados"),
    (10, "Mara", 19, "Engenharia de Software")
]

cursor.executemany('INSERT INTO alunos (id, nome, idade, curso) VALUES (?, ?, ?, ?)', alunos_data)
conn.commit()

# Consultas básicas
def consultar_tabela(query):
    df = pd.read_sql_query(query, conn)
    print(df)
    return df

# Selecionar todos os registros
df_todos = consultar_tabela("SELECT * FROM alunos")

# Selecionar nome e idade dos alunos com mais de 20 anos
df_maior_20 = consultar_tabela("SELECT nome, idade FROM alunos WHERE idade > 20")

# Selecionar alunos do curso de "Engenharia" em ordem alfabética
df_engenharia = consultar_tabela("SELECT * FROM alunos WHERE curso LIKE 'Engenharia%' ORDER BY nome")

# Contar número total de alunos
cursor.execute("SELECT COUNT(*) FROM alunos")
total_alunos = cursor.fetchone()[0]
print(f'O total de alunos na tabela é: {total_alunos}')

# Atualizar idade de um aluno específico
cursor.execute("UPDATE alunos SET idade = 26 WHERE nome = 'Zara'")
conn.commit()
consultar_tabela("SELECT * FROM alunos")

# Remover um aluno pelo ID
cursor.execute("DELETE FROM alunos WHERE id = 2")
conn.commit()
consultar_tabela("SELECT * FROM alunos")

# Fechar conexão
conn.close()

import sqlite3
import pandas as pd

# Conexão com o banco de dados
conexao = sqlite3.connect('banco_geral')
cursor = conexao.cursor()

# Criando a tabela clientes
cursor.execute('''
    CREATE TABLE IF NOT EXISTS clientes (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        idade INTEGER NOT NULL,
        saldo REAL NOT NULL
    )
''')

# Inserindo registros na tabela clientes
clientes_dados = [
    (1, "Bianca", 27, 234),
    (2, "Ana", 33, 4827),
    (3, "Esther", 24, 847),
    (4, "Larissa", 43, 98),
    (5, "Clara", 21, 412),
    (6, "Bruna", 38, 4128),
    (7, "Luana", 29, 4391),
    (8, "Zara", 25, 431),
    (9, "Seleste", 18, 421),
    (10, "Mara", 19, 4129836)
]
cursor.executemany('INSERT INTO clientes (id, nome, idade, saldo) VALUES (?, ?, ?, ?)', clientes_dados)
conexao.commit()

# Exibir clientes
query = "SELECT * FROM clientes"
df_clientes = pd.read_sql_query(query, conexao)
print(df_clientes)

# Consultas SQL
# a) Selecionar nome e idade de clientes com idade superior a 30 anos
dados_nome_idade = cursor.execute('SELECT nome, idade FROM clientes WHERE idade > 30')
print("Clientes com mais de 30 anos:")
for cliente in dados_nome_idade:
    print(cliente)

# b) Calcular saldo médio dos clientes
saldo_medio = cursor.execute('SELECT AVG(saldo) FROM clientes').fetchone()[0]
print(f"Saldo médio dos clientes: {saldo_medio}")

# c) Cliente com maior saldo
cliente_max_saldo = cursor.execute('SELECT id, nome, idade, saldo FROM clientes ORDER BY saldo DESC LIMIT 1').fetchone()
print("Cliente com maior saldo:", cliente_max_saldo)

# d) Contar clientes com saldo acima de 1000
total_clientes_acima_1000 = cursor.execute('SELECT COUNT(*) FROM clientes WHERE saldo > 1000').fetchone()[0]
print(f"Clientes com saldo acima de 1000: {total_clientes_acima_1000}")

# Atualizar saldo de um cliente específico
cursor.execute('UPDATE clientes SET saldo = 1673 WHERE id = 10')
conexao.commit()

# Remover cliente pelo ID
cursor.execute('DELETE FROM clientes WHERE id = 10')
conexao.commit()

# Criar a tabela de compras
cursor.execute('''
    CREATE TABLE IF NOT EXISTS compras (
        id INTEGER PRIMARY KEY,
        cliente_id INTEGER NOT NULL,
        produto TEXT NOT NULL,
        valor REAL NOT NULL,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id)
    )
''')

# Inserir compras na tabela
compras_dados = [
    (1, 1, "Cerveja", 20.0),
    (2, 2, "Pizza", 50.0),
    (3, 3, "Hamburguer", 15.0),
    (4, 4, "Sorvete", 10.0),
    (5, 5, "Bolo", 30.0)
]
cursor.executemany('INSERT INTO compras (id, cliente_id, produto, valor) VALUES (?, ?, ?, ?)', compras_dados)
conexao.commit()

# Exibir compras
query_compras = "SELECT * FROM compras"
df_compras = pd.read_sql_query(query_compras, conexao)
print(df_compras)

# Fechar conexão
conexao.close()
