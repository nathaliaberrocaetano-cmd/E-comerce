// ARQUIVO-PONTE: faz pedidos HTTP para a API escrita em Java.
// Você não precisa alterar este arquivo na primeira aula.

// O mesmo endereço é usado para CONSULTAR (GET) e CADASTRAR (POST).
const ENDERECO_API = '/api/produtos';

// Carrinho didático: existe apenas enquanto esta página estiver aberta.
let carrinho = [];

const campoLista = document.getElementById('lista-produtos');
const mensagemApi = document.getElementById('mensagem-api');
const mensagemCadastro = document.getElementById('mensagem-cadastro');
const formulario = document.getElementById('form-produto');
const botaoCadastro = document.getElementById('botao-cadastrar');

function emReais(valor) {
  return Number(valor).toLocaleString('pt-BR', {
    style: 'currency', currency: 'BRL'
  });
}

// PASSO 1: GET - pedir produtos ao Java e mostrá-los na página.
async function carregarProdutos() {
  mensagemApi.textContent = 'Carregando produtos...';
  try {
    const resposta = await fetch(ENDERECO_API);
    if (!resposta.ok) throw new Error('A API não respondeu corretamente.');

    const produtos = await resposta.json(); // Converte JSON em objetos JS.
    campoLista.replaceChildren();
    mensagemApi.textContent = produtos.length ? '' : 'Ainda não há produtos.';

    for (const produto of produtos) {
      // createElement + textContent evitam interpretar nomes como HTML.
      const cartao = document.createElement('article');
      cartao.className = 'cartao';
      const simbolo = document.createElement('div');
      simbolo.className = 'simbolo';
      simbolo.textContent = produto.nome.charAt(0).toUpperCase();
      const nome = document.createElement('h3');
      nome.textContent = produto.nome;
      const preco = document.createElement('p');
      preco.className = 'preco';
      preco.textContent = emReais(produto.preco);
      const estoque = document.createElement('p');
      estoque.className = 'estoque';
      estoque.textContent = 'Estoque: ' + produto.estoque;
      const botao = document.createElement('button');
      botao.textContent = produto.estoque > 0 ? 'Adicionar' : 'Sem estoque';
      botao.disabled = produto.estoque <= 0;
      botao.addEventListener('click', () => adicionarAoCarrinho(produto));
      cartao.append(simbolo, nome, preco, estoque, botao);
      campoLista.append(cartao);
    }
  } catch (erro) {
    campoLista.replaceChildren();
    mensagemApi.textContent = 'Erro ao carregar. Verifique se o Java está ligado.';
    console.error(erro);
  }
}

// PASSO 2: o carrinho NÃO altera o banco e NÃO representa compra real.
function adicionarAoCarrinho(produto) {
  const quantidade = carrinho.filter(item => item.id === produto.id).length;
  if (quantidade >= produto.estoque) {
    alert('Limite de estoque desta demonstração atingido.');
    return;
  }
  carrinho.push(produto);
  atualizarCarrinho();
}

function atualizarCarrinho() {
  const lista = document.getElementById('itens-carrinho');
  lista.replaceChildren();
  let total = 0;
  for (const produto of carrinho) {
    const item = document.createElement('li');
    item.textContent = produto.nome + ' - ' + emReais(produto.preco);
    lista.append(item);
    total += Number(produto.preco);
  }
  document.getElementById('contador').textContent = carrinho.length;
  document.getElementById('total-carrinho').textContent = 'Total: ' + emReais(total);
}

document.getElementById('limpar-carrinho').addEventListener('click', () => {
  carrinho = [];
  atualizarCarrinho();
});

// PASSO 3: POST - enviar o formulário ao Java para guardar no SQL.
formulario.addEventListener('submit', async (evento) => {
  evento.preventDefault();
  if (botaoCadastro.disabled) return; // Evita enviar duas vezes.
  const novo = {
    nome: document.getElementById('nome').value.trim(),
    preco: Number(document.getElementById('preco').value),
    estoque: Number(document.getElementById('estoque').value)
  };
  mensagemCadastro.textContent = 'Salvando...';
  botaoCadastro.disabled = true;
  try {
    const resposta = await fetch(ENDERECO_API, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(novo)
    });
    if (!resposta.ok) throw new Error('Confira nome, preço e estoque.');
    formulario.reset();
    await carregarProdutos();
    mensagemCadastro.textContent = 'Produto salvo no banco SQL!';
  } catch (erro) {
    mensagemCadastro.textContent = 'Não foi possível cadastrar. ' + erro.message;
  } finally {
    botaoCadastro.disabled = false;
  }
});

carregarProdutos(); // Inicia a loja consultando a API.
