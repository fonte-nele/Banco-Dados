import java.sql.*;

public class teste {

	public static void main(String[] args) {
		Connection c = null;

		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ServerFutebol", "postgres", "f12251095");

			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Problema ao abrir o banco de dados...");
			e.printStackTrace();
		}
		System.out.println("Banco de dados aberto com sucesso...");
		
		Statement stmt = null; 	// cria um statment
		String script; 			// armazena uma query
		
		//Faz uma busca
		try {
			stmt = c.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * "
											   + "FROM Arbitro");
			
			while(result.next()){

				String CPF = result.getString("CPF_pessoaAr");
				String Nome = result.getString("Federacao");
				System.out.println("CPF      : " + CPF);
				System.out.println("Nome     : " + Nome);
				System.out.println("--------------------------------------");
			}
			
			System.out.println("Busca realizada com sucesso...");
			
		} catch (SQLException e) {
			System.out.println("Nao foi possivel realizar a busca...");
			//e.printStackTrace();
		}
		
		
		//Faz uma insercao
		try {
			stmt = c.createStatement();
			script = "INSERT INTO Pessoa "
				   + "VALUES ('111.000.222-33', 'Gilmar', 'Troll')"; 
			stmt.executeUpdate(script);
			
			System.out.println("Insercao realizada com sucesso...");
			
		} catch (SQLException e) {
			System.out.println("Nao foi possivel realizar a insercao...");
			//e.printStackTrace();
		}
		
		
		//Faz uma pesquisa
		try {
			stmt = c.createStatement();
			script = "SELECT * "
					+ "FROM Partida ";
			
			ResultSet result = stmt.executeQuery(script);
			
			while(result.next()){
				
				String ID = result.getString("Id");
				Date Nome = result.getDate("Data");
				int publico = result.getInt("Publico");
				Float renda = result.getFloat("Renda");
				String nome_estadio = result.getString("Nome_estadio");
				String nome_mandante = result.getString("Nome_mandante");
				String nome_visitante = result.getString("Nome_visitante");
				String CPF_principal = result.getString("CPF_principal");

				System.out.println("ID      : " + ID);
				System.out.println("Nome     : " + Nome);
				System.out.println("Publico     : " + publico);
				System.out.println("Renda         : " + renda);
				System.out.println("Nome estadio: " + nome_estadio);
				System.out.println("Nome mandante: " + nome_mandante);
				System.out.println("Nome visitante: " + nome_visitante);
				System.out.println("CPF principal: " + CPF_principal);

				System.out.println("--------------------------------------");
			}
			
			System.out.println("Pesquisa realizada com sucesso...");
			
		} catch (SQLException e1) {
			System.out.println("Nao foi possivel realizar a busca...");
			//e1.printStackTrace();
		}

		//faz uma remocao
		try {
			stmt = c.createStatement();
			script = "DELETE FROM Titulos "
				   + "WHERE titulo = 'Campeonato Brasileiro and' nome_time = 'Flamengo'";
			stmt.executeUpdate(script);
			
			System.out.println("Remoção realizada com sucesso...");	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// faz uma pesquisa
		try {
			stmt = c.createStatement();
			script = "SELECT * "
					+ "FROM Estadio "
					+ "WHERE Nome = 'Mineirão'";
			ResultSet result = stmt.executeQuery(script);
			
			while(result.next()){
				String Nome = result.getString("Nome");
				int capacidade = result.getInt("Capacidade");
				int numero = result.getInt("Numero");
				int IdLocalidade = result.getInt("IdLocalidade");

				
				System.out.println("Nome     : " + Nome);
				System.out.println("Sexo     : " + capacidade);
				System.out.println("Email    : " + numero);
				System.out.println("Pontuacao: " + IdLocalidade);
				System.out.println("--------------------------------------");
			}
			
			System.out.println("Pesquisa realizada com sucesso...");	
			
		} catch (SQLException e1) {
			System.out.println("Nao foi possivel realizar a busca...");
			//e1.printStackTrace();
		}
		System.out.println("FIM");
	}
}