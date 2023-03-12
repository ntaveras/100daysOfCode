/* Class Name: Stack
 * Author: Narayana Taveras
 * Description: 
 * 	Implements a Stack using a Doubly Linked List data structure to manage the data and properties.
 * 	Method signatures:
 * 	- push(Object) : void
 *  - pop() : Object
 *  - peek() : Object
 *  - size() : Integer
 *  - isEmpty() : Boolean
 * Test Class: StackTest
 * Trigger Name: N/A
 * Change History:
 * 
 * - 12/Mar./23 - Created
 * 
*/
public class Stack {
    private DoubleLinkList stack;
    
    public Stack(){
        this.stack = new DoubleLinkList();
    }
    
    public void push(Object data){
        stack.addFirst(data);
    }
    
    public Object pop(){
        return stack.deleteFirst().data;
    }
    
    public Object peek(){
        return stack.traverseList(0).data;
    }
    
    public Integer size(){
        return stack.size;
    }
    
    public Boolean isEmpty(){
        return stack.isEmpty;
    }

}