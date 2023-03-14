/* Class Name: DoubleLinkList
 * Author: Narayana Taveras
 * Description: 
 * 	Implements a Doubly Linked List data structure, including its node sub-class.
 * 	Method signatures:
 *  - addFirst(Object) : void
 *  - addLast(Object) : void
 * 	- add(Object, Integer) : void
 *  - traverseList(Integer) : Node
 *  - deleteFirst() : Node
 *  - deleteLast() : Node
 *  - deleteAt(Integer) : Node
 *  - Node deleteNode(Node) : Node
 *  - listData() : List<Object>
 * Test Class: DoubleLinkListTest
 * Trigger Name: N/A
 * Change History:
 * 
 * - 10/Mar./23 - Created
 * 
*/
public class DoubleLinkList {
    
    public class DoubleLinkListException extends Exception {}
    
    private final DoubleLinkedNode head;
    private final DoubleLinkedNode tail;
    public Integer size{
        private set;
        get;
    }
    public Boolean isEmpty{get{return size == 0;}}
    
    public DoubleLinkList(){
        this.head = new DoublyLinkedNode();
        this.tail = new DoublyLinkedNode();
        this.head.setNext(this.tail);
        this.tail.setPrev(this.head);
        this.size = 0;
    }
    
    public void addFirst(Object data){
        DoubleLinkedNode newNode = new DoublyLinkedNode(data);
        DoubleLinkedNode priorFirstNode = this.head.getNext(); 
        newNode.setPrev(priorFirstNode.getPrev()); 
        newNode.setNext(priorFirstNode); 
        priorFirstNode.setPrev(newNode); 
        this.head.setNext(newNode);
        this.size++;
    }
    
    public void addLast(Object data){
        DoubleLinkedNode newNode = new DoublyLinkedNode(data);
        DoubleLinkedNode priorLastNode = this.tail.getPrev();
        newNode.setPrev(priorLastNode);
        newNode.setNext(this.Tail);
        this.Tail.setPrev(newNode);
        priorLastNode.setNext(newNode);
        this.size++;
    }
    
    public DoubleLinkedNode traverseList(Integer index){
        if(this.isEmpty) throw new DoubleLinkListException('The List is empty.');
        isValidPosition(index);
        Integer counter = 0;
        DoubleLinkedNode currentNode = this.head;
        do{
            currentNode = currentNode.getNext();
        } while(++counter <= index && currentNode.hasNext());
        if(counter != index)
        {
            System.debug(LoggingLevel.INFO,
                         'The traversList() method did not complete, and is not returning the expected position #' + 
                         index + ' node but instead is returning the position #' + 
                         counter +'. This is likely due to the returned node not having a next node value of null.');
        }
        System.Debug('Traverse: ' + currentNode.getData() + '[' + counter +']');
        return currentNode;
    }
    
    public void add(Integer index, Object data){
        isValidPosition(index);
        if(index == 0)
        {
            addFirst(data);
        } else if(index == this.size)
        {
            addLast(data);
        } else 
        {
            DoubleLinkedNode newNode = new DoublyLinkedNode(data);
            DoubleLinkedNode targetNode = traverseList(index);
            newNode.setPrev(targetNode.getPrev());
            newNode.setNext(targetNode);
            targetNode.getPrev().setNext(newNode);
            targetNode.setPrev(newNode);
            this.size++;
        }
    }
    
    public DoubleLinkedNode deleteNode(DoubleLinkedNode targetNode){
        targetNode.getPrev().setNext(targetNode.getNext());
        targetNode.getNext().setPrev(targetNode.getPrev());
        this.size--;
        return targetNode;
    }
    
    public DoubleLinkedNode deleteAt(Integer targetPosition){
        isValidPosition(targetPosition);
        DoubleLinkedNode deletedNode = traverseList(targetPosition);
        return deleteNode(deletedNode);
    }
    
    public DoubleLinkedNode deleteFirst(){
        return deleteAt(0);
    }
    
    public DoubleLinkedNode deleteLast(){
        return deleteAt(this.size-1);
    }
    
    public List<Object> listData(){
        List<Object> dataList = new List<Object>();
        if(this.isEmpty)
        {
            System.debug(LoggingLevel.INFO, 'The list if empty. An empty list of Objects is being returned.');            
        } else 
        {
            DoubleLinkedNode currentNode = traverseList(0);
            While(currentNode.hasNext())
            {
                System.debug(currentNode);
                dataList.add(currentNode.getData());
                currentNode = currentNode.getNext();
            }                     
        }
        return dataList;        
    }
    
    private Boolean isValidPosition(Integer index){
        if(index <= this.size && index >= 0) return true;
        throw new DoubleLinkListException('Index out of bound.');
    }
    
    public class DoublyLinkedNode implements DoubleLinkedNode{
        
        private DoubleLinkedNode prev;
        private DoubleLinkedNode next;
        private Object data;
        
        private DoublyLinkedNode(){
            this(null);
        }
        
        private DoublyLinkedNode(Object data){
            this.data = data;
            this.prev = null;
            this.next = null;
        }
        
        public void setData(Object data){
            this.data = data;
        }
        
        public Object getData(){
            return this.data;
        }
        
        public void setPrev(DoubleLinkedNode node){
            this.prev = node;
        }
        
        public DoubleLinkedNode getPrev(){
            return this.prev;
        }
        
        public void setNext(DoubleLinkedNode node){
            this.next = node;
        }
        
         public DoubleLinkedNode getNext(){
            return this.next;
        }
        
        public Boolean hasPrev(){
            return this.prev != null;
        }
        
        public Boolean hasNext(){
            return next != null;
        }
    }
}