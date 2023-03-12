/* Class Name: Queue
 * Author: Narayana Taveras
 * Description: 
 * 	Implements a Queue using a Doubly Linked List data structure to manage the data and properties.
 * 	Method signatures:
 * 	- enqueue(Object) : void
 *  - dequeue() : Object
 *  - first() : Object
 *  - size() : Integer
 *  - isEmpty() : Boolean
 * Test Class: QueueTest
 * Trigger Name: N/A
 * Change History:
 * 
 * - 12/Mar./23 - Created
 * 
*/
public class Queue {
    private DoubleLinkList queue;
    
    public Queue(){
        this.queue = new DoubleLinkList();
    }
    
    public void enqueue(Object data){
        queue.addLast(data);
    }
    
    public Object dequeue(){
        return queue.deleteFirst().data;
    }
    
    public Object first(){
        return queue.traverseList(0).data;
    }
    
    public Integer size(){
        return queue.size;
    }
    
    public Boolean isEmpty(){
        return queue.isEmpty;
    }

}