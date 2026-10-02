// Teste rápido opcional para o professor - SOMENTE JDK, sem bibliotecas extras.
// Com a loja ligada em outro terminal, execute:
// java ferramentas/VerificarServidor.java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class VerificarServidor {
    public static void main(String[] args) throws Exception {
        HttpClient cliente = HttpClient.newHttpClient();
        conferir(cliente, "http://localhost:8080/", "Loja Escola");
        conferir(cliente, "http://localhost:8080/api/produtos", "nome");
        System.out.println("OK: página HTML e API acessíveis. Faça o teste de cadastro na tela.");
    }

    private static void conferir(HttpClient cliente, String url, String termo) throws Exception {
        HttpRequest requisicao = HttpRequest.newBuilder(URI.create(url)).GET().build();
        HttpResponse<String> resposta = cliente.send(requisicao, HttpResponse.BodyHandlers.ofString());
        if (resposta.statusCode() != 200 || !resposta.body().contains(termo)) {
            throw new IllegalStateException("Falha: " + url + " HTTP " + resposta.statusCode());
        }
        System.out.println("OK: " + url);
    }
}
