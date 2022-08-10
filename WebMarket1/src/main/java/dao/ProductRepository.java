package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//생성자
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch 1334X750 Renia HD display 8-megapixel isSight Camera");
		phone.setCategory("smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
	
		Product notebook = new Product("P1235", "LG PC그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1235", "LG PC그램", 1500000);
		tablet.setDescription("212.8*125.6*6.6cm, SuperAMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);	//리스트에 phone을 추가
		listOfProducts.add(notebook);	//리스트에 phone을 추가
		listOfProducts.add(tablet);	//리스트에 phone을 추가
	
		
	}
	
	//목록 보기
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
}
