/* Author: Narayana Taveras (narayanaTaveras@gmail.com)
 * Description: 
 * 	This class is part of "Factory Pattern" implementation. The Factory Pattern
 * 	is one of five creational patterns.
 * 
 * 	The basic idea behind the factory pattern is to define an abstract factory interface, 
 * 	which provides a method for creating objects. 
 * 	The concrete implementations of the factory interface then determine the type of object that will be created.
 * 
 * 	This interface will be implemented by the concrete Factory Product.
 * 
 * Trigger Name: N/A
 * Change History:
 * 
 * - 22/Abr./23 - Created
 * 
*/
public interface IPizzaProduct {
    
    void doSomething();

}