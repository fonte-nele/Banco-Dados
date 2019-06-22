import java.sql.*;

public class tp02 {

	public static void main(String[] args) {
		Connection c = null;

		// conecta no banco de dados
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ServerFutebol", "postgres", "f12251095");

			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Problema ao abrir o banco de dados...");
			e.printStackTrace();
		}
		System.out.println("Banco de dados aberto com sucesso...");
		
		Statement stmt = null; // cria um statment
		String script; // armazena uma query
		ResultSet result; // armazena os resultados

		// faz uma busca
		try {
			stmt = c.createStatement();
			script = "SELECT * "
					+ "FROM Jogador";
			result = stmt.executeQuery(script);

			while(result.next()){
				System.out.println("CPF      : ");

				String CPF = result.getString("CPF_pessoaJ");
				String Nome = result.getString("Posicao_original");
				Date Sexo = result.getDate("Inicio_contrato");
				Date Email = result.getDate("Fim_contrato");
				int Pontuacao_Jogo = result.getInt("gols");
				int Avaliacao = result.getInt("Assistencias");
				int Ava = result.getInt("Num_camisa");
				String Avalio = result.getString("Nome_time");

				System.out.println("CPF      : " + CPF);
				System.out.println("Nome     : " + Nome);
				System.out.println("Sexo     : " + Sexo);
				System.out.println("Email    : " + Email);
				System.out.println("Pontuacao: " + Pontuacao_Jogo);
				System.out.println("Avaliacao: " + Avaliacao);
				System.out.println("Avaliacao: " + Ava);
				System.out.println("Avaliacao: " + Avalio);
				System.out.println("--------------------------------------");
			}

			System.out.println("Busca realizada com sucesso...");

		} catch (SQLException e) {
			System.out.println("Nao foi possivel realizar a busca...");
			//e.printStackTrace();
		}
	}
}