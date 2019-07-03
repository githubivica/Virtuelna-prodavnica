package dao;

import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.Artikal;
import model.Rola;
import model.User;

public class AdminDAO {

	private static SessionFactory sf = new Configuration().configure().buildSessionFactory();
	
	public static List<User> vratiSveUsere(){			//vraca sve usere
		
		List<User> listaUsera = null;
		
		Session session = sf.openSession();
		session.beginTransaction();
			try {
				String upit = "FROM User";				//vraca sve iz usera
				Query query = session.createQuery(upit);
					listaUsera = query.getResultList();
				session.getTransaction().commit();
				return listaUsera;
			} catch (Exception e) {
				session.getTransaction().rollback();
				return null;
		}finally {
			session.close();
		}
			
	}
	
	public static boolean dodajUnovcanik(User user, String balance) {

		double uplata = Double.parseDouble(balance);
		double staroStanjeUnovcaniku = user.getNovcanik();
		double konacno = uplata + staroStanjeUnovcaniku;

		if(user.getRola().equals(Rola.GAZDA)) {	//ako je administrator da ne moze sebi da poveca balance
			user.setNovcanik(0);
		}else { 
			user.setNovcanik(konacno);		//ako nije administrator podesava konacno stanje
		}

		Session session = sf.openSession();
		session.beginTransaction();
			try {
				session.update(user);
				session.getTransaction().commit();
				return true;
			} catch (Exception e) {
				session.getTransaction().rollback();
				return false;
		}finally {
			session.close();
		}
	}

	public static boolean ubaciArtikalUBazu(String imeArtikla, String cena, String stanje , String popust){

		Artikal artikal = new Artikal();
			artikal.setImeArtikla(imeArtikla);					//ubacije ime artikla
				double cenaArtikla = Double.parseDouble(cena);
			artikal.setCena(cenaArtikla);						//ubacije cenu artikla
				int stanjeUMagacinu = Integer.parseInt(stanje);
			artikal.setStanje(stanjeUMagacinu);					//ubacije stanje artikla
			if(popust.isEmpty()) {							//ako nije podesen popust onda je 0
				artikal.setPopust(0);				
			}else {
				double popustNaArtikal  = Double.parseDouble(popust);
				artikal.setPopust(popustNaArtikal);			//ako stavimo popust onda se setuje
			}
		Session session = sf.openSession();
		session.beginTransaction();
			try {
				session.save(artikal);
				session.getTransaction().commit();
				return true;
			} catch (Exception e) {
				session.getTransaction().rollback();
				return false;
		}finally {
			session.close();
		}

	}	
	
	public static boolean obrisiUsera(String userName, String password) {
		
		LoginDAO loginDAO = new LoginDAO();
		//User user = new User();
		
		boolean proveriUsera = loginDAO.daLiPostojiUserUbazi(userName);		//da li postoji user u bazi
			if(proveriUsera) {													
				boolean proveriPassword = loginDAO.daLiPasswordOdgovaraUseru(userName, password); //da li je dobar password
					if(proveriPassword) {						//ako je dobar password
						
						Session session = sf.openSession();
						session.beginTransaction();
						
						try {
							String upit = "FROM User WHERE userName = :korisnickoIme";
							Query query = session.createQuery(upit);
							query.setParameter("korisnickoIme", userName);

							List<User> userKojiSeBrise = query.getResultList();		//uzimamo listu usera sa tim imenom
							session.delete(userKojiSeBrise);			//ovde treba da ga brise

							session.getTransaction().commit();
							return true;
						} catch (Exception e) {
							session.getTransaction().rollback();
							return false;
						}finally {
							session.close();
						}						
						
					}else {										//ako nije dobar password vrati ga na login stranu
						System.out.println("Ne postoji taj password");		//ako ne postoji
						return false;
					}

			}else {											//ako ne postiji user vrati ga na login stranu		
				System.out.println("Ne postoji taj userName");		//ako ne postoji
				return false;
			}
	
	
	}
	
	
	
}
