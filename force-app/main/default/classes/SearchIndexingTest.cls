@isTest
private class SearchIndexingTest {
    // Test method to verify the indexProducts() method
    static testMethod void testIndexProducts() {
        // Create a mock list of products
        List<Product> mockProductList = new List<Product>();
        mockProductList.add(new Product(Id, 'Product1', 'Category1'));
        mockProductList.add(new Product(Id, 'Product2', 'Category2'));
        mockProductList.add(new Product(Id, 'Product3', 'Category3'));
        
        // Create a mock search engine
        SearchEngine mockSearchEngine = new SearchEngine();
        
        // Call the indexProducts() method
        SearchIndexing.indexProducts(mockProductList, mockSearchEngine);
        
        // Verify that the products have been indexed correctly
        List<Product> indexedProductList = searchEngine.executeQuery('*');
        System.assertEquals(mockProductList.size(), indexedProductList.size());
    }
    
    // Test method to verify the executeSearchQuery() method
    static testMethod void testExecuteSearchQuery() {
        // Create a mock list of products
        List<Product> mockProductList = new List<Product>();
        mockProductList.add(new Product(Id, 'Product1', 'Category1'));
        mockProductList.add(new Product(Id, 'Product2', 'Category2'));
        mockProductList.add(new Product(Id, 'Product3', 'Category3'));
        
        // Create a mock search engine
        SearchEngine mockSearchEngine = new SearchEngine();
        
        // Call the indexProducts() method
        SearchIndexing.indexProducts(mockProductList, mockSearchEngine);
        
        // Call the executeSearchQuery() method
        List<Product> searchResultList = SearchIndexing.executeSearchQuery('Product1');
        
        // Verify that the search query returns the correct product
        System.assertEquals(1, searchResultList.size());
        System.assertEquals('Product1', searchResultList[0].Name);
    }
    
    // Test method to verify the updateSearchIndex() method
    static testMethod void testUpdateSearchIndex() {
        // Create a mock list of products
        List<Product> mockProductList = new List<Product>();
        mockProductList.add(new Product(Id, 'Product1', 'Category1'));
        mockProductList.add(new Product(Id, 'Product2', 'Category2'));
        mockProductList.add(new Product(Id, 'Product3', 'Category3'));
        
        // Create a mock search engine
        SearchEngine mockSearchEngine = new SearchEngine();
        
        // Call the indexProducts() method
        SearchIndexing.indexProducts(mockProductList, mockSearchEngine);
        
        // Update the product list
        mockProductList.set(1, new Product(Id, 'ProductX', 'CategoryX'));
        
        // Call the updateSearchIndex() method
        SearchIndexing.updateSearchIndex(mockProductList, mockSearchEngine);
        
        // Verify that the search index is updated correctly
        List<Product> searchResultList = searchEngine.executeQuery('ProductX');
        System.assertEquals(1, searchResultList.size());
        System.assertEquals('ProductX', searchResultList[0].Name);
    }
}