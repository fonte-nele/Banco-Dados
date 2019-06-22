import java.sql.*;

public class banco {
	private Connection c = null;
	private Statement stmt = null; // cria um statment
	private String script = null; // armazena uma query
	private ResultSet result = null; // armazena os resultados
	
	banco(){
		
	}
	
	public String conecta(){
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ServerFutebol", "postgres", "f12251095");
			
			return "Banco de dados aberto com sucesso...";
			//System.out.println("Banco de dados aberto com sucesso...");
			
		} catch (ClassNotFoundException | SQLException e) {
			return "Problema ao abrir o banco de dados...";
			//System.out.println("Problema ao abrir o banco de dados...");
			//e.printStackTrace();
		}
		
	}
	
	public ResultSet pegaTabela(String name){
		try {
			stmt = c.createStatement();
			result = stmt.executeQuery("SELECT * "
									+ "FROM " + name);
			
			return result;
			//System.out.println("Busca realizada com sucesso...");
			
		} catch (SQLException e) {
			//System.out.println("Nao foi possivel realizar a busca...");
			e.printStackTrace();
		}
		return result;
	}
	
	public String insert(){
		try {
			stmt = c.createStatement();
			script = "INSERT INTO Titulos "
					   + "VALUES ('Campeonato Brasileiro', 'Flamengo')"; 
			stmt.executeUpdate(script);
			
			return "Insercao realizada com sucesso...";
			//System.out.println("Insercao realizada com sucesso...");
			
		} catch (SQLException e) {
			return "Nao foi possivel realizar a insercao...";
			//System.out.println("Nao foi possivel realizar a insercao...");
			//e.printStackTrace();
		}
	}
	
	public String remove(){
		try {
			stmt = c.createStatement();
			script = "DELETE FROM Titulos "
					   + "WHERE titulo = 'Campeonato Brasileiro' and nome_time = 'Flamengo'";
			stmt.executeUpdate(script);
			
			return "Remoção realizada com sucesso...";
			//System.out.println("Remoção realizada com sucesso...");
			
		} catch (SQLException e) {
			return "Remoção não realizada...";
			//e.printStackTrace();
		}
	}
}