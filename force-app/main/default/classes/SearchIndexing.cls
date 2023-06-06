public class SearchIndexing {
    // Declare class variables 
    private static List<Product> productList;
    private static SearchEngine searchEngine;
    
    // Constructor to initialize class variables
    public SearchIndexing(List<Product> productList, SearchEngine searchEngine) {
        this.productList = productList;
        this.searchEngine = searchEngine;
    }
    
    // Method to index product data in a search engine
    public void indexProducts() {
        for(Product product : productList) {
            searchEngine.indexProduct(product);
        }
    }
    
    // Method to execute search query against search index
    public List<Product> executeSearchQuery(String query) {
        return searchEngine.executeQuery(query);
    }
    
    // Method to update the search index to reflect any changes in product data
    public void updateSearchIndex() {
        for(Product product : productList) {
            searchEngine.updateIndex(product);
        }
    }
}