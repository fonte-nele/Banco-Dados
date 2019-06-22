import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JTable;
import javax.swing.JTextPane;
import javax.swing.ScrollPaneConstants;
import javax.swing.UIManager;

import java.awt.event.ActionListener;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.BoxLayout;
import javax.swing.JList;
import java.awt.BorderLayout;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import java.awt.Color;
import java.awt.Font;

public class gui {

	private JFrame frmTrabalhoPrtico;
	private banco bd;
	private String msg;
	private ResultSet result;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui window = new gui();
					window.frmTrabalhoPrtico.setVisible(true);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public gui() {
		initialize();
		bd = new banco();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTrabalhoPrtico = new JFrame();
		frmTrabalhoPrtico.setFont(new Font("Arial", Font.PLAIN, 12));
		frmTrabalhoPrtico.setBackground(Color.WHITE);
		frmTrabalhoPrtico.setTitle("Trabalho pr\u00E1tico 02 - BCC321");
		frmTrabalhoPrtico.setBounds(100, 100, 500, 700);
		frmTrabalhoPrtico.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// frmTrabalhoPrtico.setUndecorated(true);
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		JMenuBar menuBar = new JMenuBar();
		frmTrabalhoPrtico.setJMenuBar(menuBar);
		
		JMenu mnMenu = new JMenu("Menu");
		menuBar.add(mnMenu);
		frmTrabalhoPrtico.getContentPane().setLayout(new BorderLayout(0, 0));
		
		JTextPane textPane = new JTextPane();
		textPane.setForeground(Color.WHITE);
		textPane.setBackground(Color.BLACK);
		textPane.setEditable(false);
		textPane.setFont(new Font("Courier New", Font.PLAIN, 14));
		frmTrabalhoPrtico.getContentPane().add(textPane);
		
		JScrollPane scrollPane = new JScrollPane(textPane);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		frmTrabalhoPrtico.getContentPane().add(scrollPane);
		

		
		JMenuItem mntmConectar = new JMenuItem("Conectar");
		mntmConectar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				msg = bd.conecta();
				textPane.setText(msg);
			}
		});
		mnMenu.add(mntmConectar);
		
		JMenuItem mntmMostrarTabela = new JMenuItem("Mostrar tabela Árbitro");
		mntmMostrarTabela.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				textPane.setText("");
				
				result = bd.pegaTabela("Arbitro");
			
				try {
					String dado = "";
					
					while(result.next()){

						String CPF = result.getString("CPF_pessoaAr");
						String Nome = result.getString("Federacao");
						dado += "CPF              : " + CPF + "\n";
						dado += "Federação        : " + Nome + "\n";
						dado += "--------------------------------------" + "\n";
					}
					
					textPane.setText(dado);
					
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		mnMenu.add(mntmMostrarTabela);
		
		
		JMenuItem mntmMostrarTabela_1 = new JMenuItem("Mostrar Partida");
		mntmMostrarTabela_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				textPane.setText("");
				
				result = bd.pegaTabela("Partida");
				
				
				try {
					String dado = "";
					
					while(result.next()){

						String ID = result.getString("Id");
						Date Nome = result.getDate("Data");
						int publico = result.getInt("Publico");
						Float renda = result.getFloat("Renda");
						String nome_estadio = result.getString("Nome_estadio");
						String nome_mandante = result.getString("Nome_mandante");
						String nome_visitante = result.getString("Nome_visitante");
						String CPF_principal = result.getString("CPF_principal");
						dado += "ID               : " + ID + "\n";
						dado += "Nome             : " + Nome + "\n";
						dado += "publico          : " + publico + "\n";
						dado += "Renda            : " + renda + "\n";
						dado += "Nome estádio             : " + nome_estadio + "\n";
						dado += "Nome mandante            : " + nome_mandante + "\n";
						dado += "Nome visitante           : " + nome_visitante + "\n";
						dado += "CPF do árbitro principal : " + CPF_principal + "\n";
						dado += "--------------------------------------" + "\n";
					}
					
					textPane.setText(dado);
					
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		mnMenu.add(mntmMostrarTabela_1);
		
		JMenuItem mntmMostrarTabela_2 = new JMenuItem("Mostrar tabela Estádio");
		mntmMostrarTabela_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				textPane.setText("");

				result = bd.pegaTabela("Estádio");

				try {
					String dado = "";

					while (result.next()) {

						String Nome = result.getString("Nome");
						int capacidade = result.getInt("Capacidade");
						int numero = result.getInt("Numero");
						int IdLocalidade = result.getInt("IdLocalidade");
						dado += "Nome          : " + Nome + "\n";
						dado += "Capacidade            : " + capacidade + "\n";
						dado += "Número           : " + numero + "\n";
						dado += "Localização       : " + IdLocalidade + "\n";
						dado += "--------------------------------------" + "\n";
					}

					textPane.setText(dado);

				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
		});
		
		JMenuItem mntmInsert = new JMenuItem("Insert titulo");
		mntmInsert.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				textPane.setText("");
				
				msg = bd.insert();
				
				textPane.setText(msg);
			}
		});
		mnMenu.add(mntmInsert);
		
		JMenuItem mntmRemoveTabelaClinte = new JMenuItem("Remove tabela Titulo");
		mntmRemoveTabelaClinte.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				textPane.setText("");
				
				msg = bd.remove();
				
				textPane.setText(msg);
				
			}
		});
		mnMenu.add(mntmRemoveTabelaClinte);
	}
}