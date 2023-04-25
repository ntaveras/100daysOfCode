public class PizzaFactory{
    
    public IPizzaProduct createPizza(String productType) {
        IPizzaFactory factory;
        if(productType.toLowerCase() == 'cheesepizza') {
            
        } else if(productType.toLowerCase() == 'pepperonipizza') {
            
        } else {
            throw new IllegalArgumentException ('The provided Product Type is not a valid type of Product for the Factory.');
        }
        return factory.createPizza();
    }

}