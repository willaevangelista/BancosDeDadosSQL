{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyOQCbzeu7bv+QsxuuX6K5/u",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/willaevangelista/BancosDeDadosSQL/blob/main/bancodedados.sql\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Importações"
      ],
      "metadata": {
        "id": "PkZKsbHBynlD"
      }
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {
        "id": "WbFNbSaAydUt"
      },
      "outputs": [],
      "source": [
        "import pandas as pd\n",
        "import sqlite3"
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 1"
      ],
      "metadata": {
        "id": "rEmzjTbyy81x"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Crie uma tabela chamada \"alunos\" com os seguintes campos: id\n",
        "(inteiro), nome (texto), idade (inteiro) e curso (texto)."
      ],
      "metadata": {
        "id": "ewseBz7_zNGY"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# criação da tabela alunos\n",
        "\n",
        "alunos = sqlite3.connect('banco_alunos.db')"
      ],
      "metadata": {
        "id": "Mun-1wRgzXqN"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# criação de cursor para executar os comandos SQL\n",
        "\n",
        "cursor = alunos.cursor()"
      ],
      "metadata": {
        "id": "iGtJkVD5zwf8"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# criação dos campos da tabela\n",
        "\n",
        "cursor.execute('CREATE TABLE alunos(Id INT, Nome VARCHAR, Idade INT, Curso VARCHAR)')"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "DkPM9fyLz__p",
        "outputId": "8c9b6398-7501-4155-b388-0ebe46b3f96c"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "execute_result",
          "data": {
            "text/plain": [
              "<sqlite3.Cursor at 0x7abe06b19ac0>"
            ]
          },
          "metadata": {},
          "execution_count": 16
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# salvar as alterações feitas na tabela\n",
        "\n",
        "alunos.commit()"
      ],
      "metadata": {
        "id": "v9NcycZT0kHy"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# PRINTANDO A TABELA\n",
        "\n",
        "# consulta SQL\n",
        "query = \"SELECT * FROM alunos\"\n",
        "\n",
        "# carregar os resultados no pandas\n",
        "df = pd.read_sql_query(query, alunos)\n",
        "\n",
        "# exibir a tabela no Colab\n",
        "df\n",
        "\n",
        "# printando os resultados\n",
        "print(df)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "6m3UtpRUoSUg",
        "outputId": "d02026d5-9af2-47b9-852b-6a90cf93d426"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "Empty DataFrame\n",
            "Columns: [Id, Nome, Idade, Curso]\n",
            "Index: []\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 2"
      ],
      "metadata": {
        "id": "6e76zp4Py9V8"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Insira pelo menos 5 registros de alunos na tabela que você criou no\n",
        "exercício anterior."
      ],
      "metadata": {
        "id": "vEwS0SxJzXQP"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# inclusão de 10 registros de alunas na tabela\n",
        "\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(1, \"Bianca\", 27, \"Análise de Dados\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(2, \"Ana\", 33, \"Programação em Java\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(3, \"Esther\", 24, \"Desenvolvimento de Software\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(4, \"Larissa\", 43, \"Ciência da Computação\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(5, \"Clara\", 21, \"Desenvolvimento de Sistemas\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(6, \"Bruna\", 38, \"Engenharia da Computação\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(7, \"Luana\", 29, \"Engenharia de Programação\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(8, \"Zara\", 25, \"Engenharia de Sistemas\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(9, \"Seleste\", 18, \"Engenharia de Dados\")')\n",
        "cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES(10, \"Mara\", 19, \"Engenharia de Software\")')"
      ],
      "metadata": {
        "id": "TctRGkmNzW1r",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "240a4bf8-fb5f-439f-aab6-64202b50f8a7"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "execute_result",
          "data": {
            "text/plain": [
              "<sqlite3.Cursor at 0x7abe06b19ac0>"
            ]
          },
          "metadata": {},
          "execution_count": 19
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# salvar as alterações feitas na tabela\n",
        "\n",
        "alunos.commit()"
      ],
      "metadata": {
        "id": "UUnhEziAnGLW"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# PRINTANDO A TABELA\n",
        "\n",
        "# consulta SQL\n",
        "query = \"SELECT * FROM alunos\"\n",
        "\n",
        "# carregar os resultados no pandas\n",
        "df = pd.read_sql_query(query, alunos)\n",
        "\n",
        "# exibir a tabela no Colab\n",
        "df\n",
        "\n",
        "# printando os resultados\n",
        "print(df)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "lZnoiWTum4s5",
        "outputId": "d25e1359-3087-4abf-cb6b-25e6ed73a81c"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "   Id     Nome  Idade                        Curso\n",
            "0   1   Bianca     27             Análise de Dados\n",
            "1   2      Ana     33          Programação em Java\n",
            "2   3   Esther     24  Desenvolvimento de Software\n",
            "3   4  Larissa     43        Ciência da Computação\n",
            "4   5    Clara     21  Desenvolvimento de Sistemas\n",
            "5   6    Bruna     38     Engenharia da Computação\n",
            "6   7    Luana     29    Engenharia de Programação\n",
            "7   8     Zara     25       Engenharia de Sistemas\n",
            "8   9  Seleste     18          Engenharia de Dados\n",
            "9  10     Mara     19       Engenharia de Software\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 3"
      ],
      "metadata": {
        "id": "wTaodcO4y9of"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "**Consultas Básicas** <br>\n",
        "Escreva consultas SQL para realizar as seguintes tarefas:"
      ],
      "metadata": {
        "id": "ncUFKl4w1VIc"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "a) Selecionar todos os registros da tabela \"alunos\"."
      ],
      "metadata": {
        "id": "MT-YqkgL1fSJ"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "dados_total = cursor.execute('SELECT * FROM alunos')\n",
        "\n",
        "for alunos in dados_total:\n",
        "  print(alunos)"
      ],
      "metadata": {
        "id": "RJn8OdEl1hv1",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "12d6ffb9-95eb-4f79-820a-66e388a4a9eb"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(1, 'Bianca', 27, 'Análise de Dados')\n",
            "(2, 'Ana', 33, 'Programação em Java')\n",
            "(3, 'Esther', 24, 'Desenvolvimento de Software')\n",
            "(4, 'Larissa', 43, 'Ciência da Computação')\n",
            "(5, 'Clara', 21, 'Desenvolvimento de Sistemas')\n",
            "(6, 'Bruna', 38, 'Engenharia da Computação')\n",
            "(7, 'Luana', 29, 'Engenharia de Programação')\n",
            "(8, 'Zara', 25, 'Engenharia de Sistemas')\n",
            "(9, 'Seleste', 18, 'Engenharia de Dados')\n",
            "(10, 'Mara', 19, 'Engenharia de Software')\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "b) Selecionar o nome e a idade dos alunos com mais de 20 anos."
      ],
      "metadata": {
        "id": "D93PNEq-1iHX"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "dados_idade = cursor.execute('SELECT nome, idade FROM alunos WHERE idade > 20')\n",
        "\n",
        "for alunos in dados_idade:\n",
        "  print(alunos)"
      ],
      "metadata": {
        "id": "mqTuA7Qj1kZg",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "adf64ab0-17be-4e52-b179-1f7040e9f34a"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "('Bianca', 27)\n",
            "('Ana', 33)\n",
            "('Esther', 24)\n",
            "('Larissa', 43)\n",
            "('Clara', 21)\n",
            "('Bruna', 38)\n",
            "('Luana', 29)\n",
            "('Zara', 25)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "c) Selecionar os alunos do curso de \"Engenharia\" em ordem\n",
        "alfabética."
      ],
      "metadata": {
        "id": "wEyHmQTP1kxh"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "engenharia_ordem = cursor.execute('SELECT * FROM alunos WHERE Curso LIKE \"Engenharia%\" ORDER BY nome')\n",
        "\n",
        "for alunos in engenharia_ordem:\n",
        "  print(alunos)"
      ],
      "metadata": {
        "id": "EzAvnLeT1nwg",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "909f3c6f-fcc9-468c-8bed-6ee75d2ab786"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(6, 'Bruna', 38, 'Engenharia da Computação')\n",
            "(7, 'Luana', 29, 'Engenharia de Programação')\n",
            "(10, 'Mara', 19, 'Engenharia de Software')\n",
            "(9, 'Seleste', 18, 'Engenharia de Dados')\n",
            "(8, 'Zara', 25, 'Engenharia de Sistemas')\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "d) Contar o número total de alunos na tabela"
      ],
      "metadata": {
        "id": "SDmPvK-o1nWJ"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# contagem de quantos alunos tem na tabela - gera um código\n",
        "resultado = cursor.execute(\"SELECT COUNT(*) FROM alunos\")\n",
        "\n",
        "# \"tradução\" do código para a linguagem \"humana\"\n",
        "total_alunos = resultado.fetchone()[0]\n",
        "\n",
        "print('O total de alunos na tabela é: ' + str(total_alunos))"
      ],
      "metadata": {
        "id": "puYVcFV71rIl",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "90631ad8-8c5e-491c-91fe-10c40eb4ea05"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "O total de alunos na tabela é: 10\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 4"
      ],
      "metadata": {
        "id": "UmJ-aZIBy95i"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "**Atualização e Remoção**"
      ],
      "metadata": {
        "id": "fHwENBT51s5R"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "a) Atualize a idade de um aluno específico na tabela."
      ],
      "metadata": {
        "id": "09DMp9yo1wWm"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# fazendo update de idade de aluno específico e definindo variável para essa ação\n",
        "# isso é uma tupla, então não dá para printar direto (é necessário criar outra variável para isso), nem fazer commit\n",
        "\n",
        "update_idade = cursor.execute('UPDATE alunos SET idade = 26 WHERE nome = \"Zara\"')\n",
        "\n",
        "# atualizando tabela para viabilizar o print\n",
        "tabela_atualizada = cursor.execute(\"SELECT * FROM alunos\")\n",
        "\n",
        "# print da tabela considerando essas alterações\n",
        "for alunos in tabela_atualizada:\n",
        "  print(alunos)"
      ],
      "metadata": {
        "id": "c-yK9LAa1466",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "762b830b-5ea1-493a-a507-670a77677393"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(1, 'Bianca', 27, 'Análise de Dados')\n",
            "(2, 'Ana', 33, 'Programação em Java')\n",
            "(3, 'Esther', 24, 'Desenvolvimento de Software')\n",
            "(4, 'Larissa', 43, 'Ciência da Computação')\n",
            "(5, 'Clara', 21, 'Desenvolvimento de Sistemas')\n",
            "(6, 'Bruna', 38, 'Engenharia da Computação')\n",
            "(7, 'Luana', 29, 'Engenharia de Programação')\n",
            "(8, 'Zara', 26, 'Engenharia de Sistemas')\n",
            "(9, 'Seleste', 18, 'Engenharia de Dados')\n",
            "(10, 'Mara', 19, 'Engenharia de Software')\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "b) Remova um aluno pelo seu ID."
      ],
      "metadata": {
        "id": "h2JwZQxb1wIZ"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# deletando aluno por seu ID e definindo variável para essa ação\n",
        "# isso é uma tupla, então não dá para printar direto (é necessário criar outra variável para isso), nem fazer commit\n",
        "delete_id = cursor.execute('DELETE FROM alunos WHERE id = 2')\n",
        "\n",
        "# atualizando tabela para viabilizar o print\n",
        "tabela_exclusao = cursor.execute(\"SELECT * FROM alunos\")\n",
        "\n",
        "# print da tabela considerando essas alterações\n",
        "for alunos in tabela_exclusao:\n",
        "  print(alunos)"
      ],
      "metadata": {
        "id": "UOyDSvin17a-",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "6ee274ed-e3d7-4567-8f6b-27f18ebd1693"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(1, 'Bianca', 27, 'Análise de Dados')\n",
            "(3, 'Esther', 24, 'Desenvolvimento de Software')\n",
            "(4, 'Larissa', 43, 'Ciência da Computação')\n",
            "(5, 'Clara', 21, 'Desenvolvimento de Sistemas')\n",
            "(6, 'Bruna', 38, 'Engenharia da Computação')\n",
            "(7, 'Luana', 29, 'Engenharia de Programação')\n",
            "(8, 'Zara', 26, 'Engenharia de Sistemas')\n",
            "(9, 'Seleste', 18, 'Engenharia de Dados')\n",
            "(10, 'Mara', 19, 'Engenharia de Software')\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 5"
      ],
      "metadata": {
        "id": "f9_qhX-OzDki"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Criar uma Tabela e Inserir Dados"
      ],
      "metadata": {
        "id": "-TKEAkAy19I0"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Crie uma tabela chamada \"clientes\" com os campos: id (chave\n",
        "primária), nome (texto), idade (inteiro) e saldo (float). Insira alguns\n",
        "registros de clientes na tabela."
      ],
      "metadata": {
        "id": "IGvbvCOX2AeZ"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# criação da tabela clientes\n",
        "\n",
        "clientes = sqlite3.connect('banco_geral')"
      ],
      "metadata": {
        "id": "jzg-1-S7H2kn"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# criação de cursor para executar os comandos SQL\n",
        "\n",
        "cursor = clientes.cursor()"
      ],
      "metadata": {
        "id": "DUTCoswMJSuy"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# criação dos campos da tabela\n",
        "\n",
        "cursor.execute('CREATE TABLE clientes(id INTEGER PRIMARY KEY, Nome VARCHAR, Idade INT, Saldo FLOAT)')"
      ],
      "metadata": {
        "id": "o-OIwdJQ2C2s",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "1542b65e-caab-4769-dc93-69c91da0773f"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "execute_result",
          "data": {
            "text/plain": [
              "<sqlite3.Cursor at 0x7abe06b1a940>"
            ]
          },
          "metadata": {},
          "execution_count": 30
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# inclusão de 10 registros de alunas na tabela\n",
        "\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(1, \"Bianca\", 27, 234)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(2, \"Ana\", 33, 4827)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(3, \"Esther\", 24, 847)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(4, \"Larissa\", 43, 98)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(5, \"Clara\", 21, 412)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(6, \"Bruna\", 38, 4128)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(7, \"Luana\", 29, 4391)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(8, \"Zara\", 25, 431)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(9, \"Seleste\", 18, 421)')\n",
        "cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES(10, \"Mara\", 19, 4129836)')"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "ztLae9O0MBHV",
        "outputId": "dadeb558-7fd1-4cf4-ff7c-caeb0c7418b6"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "execute_result",
          "data": {
            "text/plain": [
              "<sqlite3.Cursor at 0x7abe06b1a940>"
            ]
          },
          "metadata": {},
          "execution_count": 31
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# salvar as alterações feitas na tabela\n",
        "\n",
        "clientes.commit()"
      ],
      "metadata": {
        "id": "wW8oBib5J4lV"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# PRINTANDO A TABELA\n",
        "\n",
        "# consulta SQL\n",
        "query = \"SELECT * FROM clientes\"\n",
        "\n",
        "# carregar os resultados no pandas\n",
        "df = pd.read_sql_query(query, clientes)\n",
        "\n",
        "# exibir a tabela no Colab\n",
        "df\n",
        "\n",
        "# printando os resultados\n",
        "print(df)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "sCH1qDHmJ8cl",
        "outputId": "eb4a4798-3f67-46a4-813e-2b3a3d535ee1"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "   id     Nome  Idade      Saldo\n",
            "0   1   Bianca     27      234.0\n",
            "1   2      Ana     33     4827.0\n",
            "2   3   Esther     24      847.0\n",
            "3   4  Larissa     43       98.0\n",
            "4   5    Clara     21      412.0\n",
            "5   6    Bruna     38     4128.0\n",
            "6   7    Luana     29     4391.0\n",
            "7   8     Zara     25      431.0\n",
            "8   9  Seleste     18      421.0\n",
            "9  10     Mara     19  4129836.0\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "conexao = sqlite3.connect('banco_geral')\n",
        "query = \"SELECT name FROM sqlite_master WHERE type='table';\"\n",
        "df = pd.read_sql_query(query, conexao)\n",
        "\n",
        "print(df)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "0_XI09wLxpV-",
        "outputId": "9e020d41-3e28-49fb-ddc7-b76c3b9cec94"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "       name\n",
            "0  clientes\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 6"
      ],
      "metadata": {
        "id": "ahMQcfDTzD2o"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "**Consultas e Funções Agregadas** </br>\n",
        "Escreva consultas SQL para realizar as seguintes tarefas:"
      ],
      "metadata": {
        "id": "PbDqtIIc2FOo"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "a) Selecione o nome e a idade dos clientes com idade superior a\n",
        "30 anos."
      ],
      "metadata": {
        "id": "6bemPJdK2Lji"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Seleção do nome e idade dos clientes com idade superior a 30 anos\n",
        "dados_nome_idade = cursor.execute('SELECT nome, idade FROM clientes WHERE idade > 30')\n",
        "\n",
        "# Print dos Resultados\n",
        "for clientes in dados_nome_idade:\n",
        "  print(clientes)"
      ],
      "metadata": {
        "id": "Oqp1KVQS2Nf_",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "2ac71638-3883-470c-fbc6-86ef223711b2"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "('Ana', 33)\n",
            "('Larissa', 43)\n",
            "('Bruna', 38)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "b) Calcule o saldo médio dos clientes."
      ],
      "metadata": {
        "id": "6hVEU2z12NvF"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Calculo da média da coluna clientes\n",
        "saldo_medio = cursor.execute('SELECT AVG(saldo) FROM clientes')\n",
        "\n",
        "for clientes in saldo_medio:\n",
        "  print(clientes)"
      ],
      "metadata": {
        "id": "StwZfTd12P1L",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "43d4b240-3c5a-4d00-e83e-1c2b1f41088e"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(414562.5,)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "**c**) Encontre o cliente com o saldo máximo."
      ],
      "metadata": {
        "id": "522rkDpg2QKn"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "saldo_medio = cursor.execute('SELECT id, nome, idade, MAX(saldo) FROM clientes')\n",
        "\n",
        "for clientes in saldo_medio:\n",
        "  print(clientes)"
      ],
      "metadata": {
        "id": "C60WRIxi2S4w",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "fc7ee08b-b29e-4091-81a5-73bbc9187b89"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(10, 'Mara', 19, 4129836.0)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "d) Conte quantos clientes têm saldo acima de 1000."
      ],
      "metadata": {
        "id": "E1UX7PC92TUE"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Conta de quantos clientes têm saldo acima de 100 (dado que precisa ser processado)\n",
        "\n",
        "saldo_maior = cursor.execute('SELECT COUNT(*) FROM clientes WHERE saldo > 1000')\n",
        "\n",
        "# Pega o primeiro valor retornado pela consulta (o número total de clientes)\n",
        "total_clientes = saldo_maior.fetchone()[0]\n",
        "\n",
        "# Print do resultado\n",
        "print('Clientes que têm saldo acima de 1000: ' + str(total_clientes))"
      ],
      "metadata": {
        "id": "sJ92TJ7A2XE_",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "459e6757-adf4-4cb1-f644-caeb5c3782ba"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "Clientes que têm saldo acima de 1000: 4\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 7"
      ],
      "metadata": {
        "id": "nIdJz1tyzHih"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "**Atualização e Remoção com Condições**"
      ],
      "metadata": {
        "id": "VPMfZxB-2YH3"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "a) Atualize o saldo de um cliente específico."
      ],
      "metadata": {
        "id": "Ho-qgGVT2cm2"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Atualização do Saldo da cliente Mara / Id 10\n",
        "atualizacao = cursor.execute('UPDATE clientes SET saldo = 1673 WHERE id = 10')\n",
        "\n",
        "# Seleção da tabela inteira\n",
        "tabela_nova = cursor.execute('SELECT * FROM clientes')\n",
        "\n",
        "# Print da tabela com atualização\n",
        "for clientes in tabela_nova:\n",
        "  print(clientes)"
      ],
      "metadata": {
        "id": "Q--qfwOI2f4O",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "f3ec3408-2251-4db1-ff75-36103acef7c6"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(1, 'Bianca', 27, 234.0)\n",
            "(2, 'Ana', 33, 4827.0)\n",
            "(3, 'Esther', 24, 847.0)\n",
            "(4, 'Larissa', 43, 98.0)\n",
            "(5, 'Clara', 21, 412.0)\n",
            "(6, 'Bruna', 38, 4128.0)\n",
            "(7, 'Luana', 29, 4391.0)\n",
            "(8, 'Zara', 25, 431.0)\n",
            "(9, 'Seleste', 18, 421.0)\n",
            "(10, 'Mara', 19, 1673.0)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "b) Remova um cliente pelo seu ID."
      ],
      "metadata": {
        "id": "9c2TieQQ2cpf"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Remoção da cliente Mara em função de seu ID (10)\n",
        "remocao = cursor.execute('DELETE FROM clientes WHERE Id = 10')\n",
        "\n",
        "# Seleção da Tabela Inteira\n",
        "tabela_remocao = cursor.execute('SELECT * FROM clientes')\n",
        "\n",
        "# Print da Tabela com Remoção\n",
        "for clientes in tabela_remocao:\n",
        "  print(clientes)"
      ],
      "metadata": {
        "id": "Ln7VUQuZ2gZD",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "c45286da-9738-4838-ffe4-ae6e97587473"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "(1, 'Bianca', 27, 234.0)\n",
            "(2, 'Ana', 33, 4827.0)\n",
            "(3, 'Esther', 24, 847.0)\n",
            "(4, 'Larissa', 43, 98.0)\n",
            "(5, 'Clara', 21, 412.0)\n",
            "(6, 'Bruna', 38, 4128.0)\n",
            "(7, 'Luana', 29, 4391.0)\n",
            "(8, 'Zara', 25, 431.0)\n",
            "(9, 'Seleste', 18, 421.0)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "conexao = sqlite3.connect('banco_geral')\n",
        "\n",
        "conexao.close()"
      ],
      "metadata": {
        "id": "7mifXWGC2tWt"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Exercício 8"
      ],
      "metadata": {
        "id": "6-MH4AFmzHyO"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "**Junção de Tabelas**"
      ],
      "metadata": {
        "id": "NB2a6gUV2hu0"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Crie uma segunda tabela chamada \"compras\" com os campos: id\n",
        "(chave primária), cliente_id (chave estrangeira referenciando o id\n",
        "da tabela \"clientes\"), produto (texto) e valor (real)."
      ],
      "metadata": {
        "id": "tiCXWxgG3ASA"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Encerrando os processos abertos da base de dados \"banco_geral\"\n",
        "\n",
        "!fuser banco_geral\n",
        "!fuser -k banco_geral\n"
      ],
      "metadata": {
        "id": "Ct6skWlS40IB"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "import sqlite3\n",
        "import pandas as pd\n",
        "\n",
        "# Criação da tabela Compras\n",
        "\n",
        "compras = sqlite3.connect('banco_geral')\n",
        "\n",
        "cursor = compras.cursor()\n",
        "\n",
        "cursor.execute('CREATE TABLE compras (id INTEGER PRIMARY KEY, cliente_id INT, produto TEXT, valor REAL, FOREIGN KEY (cliente_id) REFERENCES reclientes(id))')\n",
        "\n",
        "# salvando alterações\n",
        "\n",
        "compras.commit()"
      ],
      "metadata": {
        "id": "klA84GSZ3JGC"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "Insira algumas compras associadas a clientes existentes na tabela \"clientes\"."
      ],
      "metadata": {
        "id": "ZlkcerVr3Fmi"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# inclusão de 10 registros de compras na tabela\n",
        "\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(1, 1, \"Cerveja\", 20.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(2, 2, \"Pizza\", 50.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(3, 3, \"Hamburguer\", 15.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(4, 4, \"Sorvete\", 10.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(5, 5, \"Biscoito\", 5.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(6, 6, \"Macarrão\", 8.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(7, 7, \"Chocolate\", 12.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(8, 8, \"Suco\", 3.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(9, 9, \"Batata\", 7.0)')\n",
        "cursor.execute('INSERT INTO compras(id, cliente_id, Produto, Valor) VALUES(10, 10, \"Salada\", 10.0)')\n",
        "\n",
        "# salvando alterações\n",
        "\n",
        "compras.commit()"
      ],
      "metadata": {
        "id": "Q9odSOZU3Jn6"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# PRINTANDO A TABELA\n",
        "\n",
        "# consulta SQL\n",
        "query = \"SELECT * FROM compras\"\n",
        "\n",
        "# carregar os resultados no pandas\n",
        "df = pd.read_sql_query(query, compras)\n",
        "\n",
        "# exibir a tabela no Colab\n",
        "df\n",
        "\n",
        "# printando os resultados\n",
        "print(df)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "4EgPtDLAzHQ2",
        "outputId": "59bf1ee1-0fff-43ba-fdd6-fd49781edd38"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "   id  cliente_id     produto  valor\n",
            "0   1           1     Cerveja   20.0\n",
            "1   2           2       Pizza   50.0\n",
            "2   3           3  Hamburguer   15.0\n",
            "3   4           4     Sorvete   10.0\n",
            "4   5           5    Biscoito    5.0\n",
            "5   6           6    Macarrão    8.0\n",
            "6   7           7   Chocolate   12.0\n",
            "7   8           8        Suco    3.0\n",
            "8   9           9      Batata    7.0\n",
            "9  10          10      Salada   10.0\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "conexao = sqlite3.connect('banco_geral')\n",
        "query = \"SELECT name FROM sqlite_master WHERE type='table';\"\n",
        "df = pd.read_sql_query(query, conexao)\n",
        "\n",
        "print(df)"
      ],
      "metadata": {
        "id": "QsEWqDAo3KSB",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "f91a400b-3dc0-4e51-b5aa-4a25bad7275b"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "       name\n",
            "0  clientes\n",
            "1   compras\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "Escreva uma consulta para exibir o nome do cliente, o produto e o\n",
        "valor de cada compra."
      ],
      "metadata": {
        "id": "KOjMHL2d3IOp"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Conectando ao banco de dados\n",
        "conexao = sqlite3.connect('banco_geral')\n",
        "\n",
        "# Realizando o JOIN entre as tabelas 'reclientes' e 'compras'\n",
        "query = '''\n",
        "    SELECT clientes.Nome, compras.produto, compras.valor\n",
        "    FROM clientes\n",
        "    INNER JOIN compras ON clientes.id = compras.cliente_id\n",
        "'''\n",
        "\n",
        "# Carregar os resultados no pandas\n",
        "df = pd.read_sql_query(query, conexao)\n",
        "\n",
        "# Exibir os resultados\n",
        "print(df)\n",
        "\n",
        "# Fechar a conexão\n",
        "conexao.close()\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "MAxi3rNh5NTF",
        "outputId": "008f6dcd-9c2c-4baa-ba7c-3a6fb83f0e30"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "      Nome     produto  valor\n",
            "0   Bianca     Cerveja   20.0\n",
            "1      Ana       Pizza   50.0\n",
            "2   Esther  Hamburguer   15.0\n",
            "3  Larissa     Sorvete   10.0\n",
            "4    Clara    Biscoito    5.0\n",
            "5    Bruna    Macarrão    8.0\n",
            "6    Luana   Chocolate   12.0\n",
            "7     Zara        Suco    3.0\n",
            "8  Seleste      Batata    7.0\n",
            "9     Mara      Salada   10.0\n"
          ]
        }
      ]
    }
  ]
}