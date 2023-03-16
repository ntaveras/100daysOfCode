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
 * - 14/Mar./23 - Updated Node class to implement the DoublyLinkedNode interface in order to allow for hash table to use * the Double Line List DS.
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
        this.head = new DLN();
        this.tail = new DLN();
        this.head.setNext(this.tail);
        this.tail.setPrev(this.head);
        this.size = 0;
    }
    
    public void addFirst(Object data){
        DoubleLinkedNode newNode = new DLN(data);
        addFirst(newNode);
    }
    
    public void addFirst(DoubleLinkedNode node){
        DoubleLinkedNode priorFirstNode = this.head.getNext(); 
        node.setPrev(priorFirstNode.getPrev()); 
        node.setNext(priorFirstNode); 
        priorFirstNode.setPrev(node); 
        this.head.setNext(node);
        this.size++;
    }
    
    public void addLast(Object data){
        DoubleLinkedNode newNode = new DLN(data);
        addLast(newNode);
    }
    
    public void addLast(DoubleLinkedNode node){
        DoubleLinkedNode priorLastNode = this.tail.getPrev();
        node.setPrev(priorLastNode);
        node.setNext(this.Tail);
        this.Tail.setPrev(node);
        priorLastNode.setNext(node);
        this.size++;
    }
    
    public DoubleLinkedNode traverseList(Integer index){
        if(this.isEmpty) throw new DoubleLinkListException('The List is empty.');
        isValidPosition(index);
        Integer counter = -1;
        DoubleLinkedNode currentNode = this.head;
        while(counter < index && currentNode.hasNext())
        {
            currentNode = currentNode.getNext();
            counter++;
        }
        if(counter != index)
        {
            System.debug(LoggingLevel.INFO,
                         'The traversList() method did not complete, and is not returning the expected position #' + 
                         index + ' node but instead is returning the position #' + 
                         counter +'. This is likely due to the returned node not having a next node value of null.');
        }
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
            DoubleLinkedNode newNode = new DLN(data);
            DoubleLinkedNode targetNode = traverseList(index);
            newNode.setPrev(targetNode.getPrev());
            newNode.setNext(targetNode);
            targetNode.getPrev().setNext(newNode);
            targetNode.setPrev(newNode);
            this.size++;
        }
    }
    
    public void add(Integer index, DoubleLinkedNode node){
        isValidPosition(index);
        if(index == 0)
        {
            addFirst(node);
        } else if(index == this.size)
        {
            addLast(node);
        } else 
        {
            DoubleLinkedNode targetNode = traverseList(index);
            node.setPrev(targetNode.getPrev());
            node.setNext(targetNode);
            targetNode.getPrev().setNext(node);
            targetNode.setPrev(node);
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
    
    public class DLN implements DoubleLinkedNode{
        
        private DoubleLinkedNode prev;
        private DoubleLinkedNode next;
        private Object data;
        
        private DLN(){
            this(null);
        }
        
        private DLN(Object data){
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
            return this.next != null;
        }
    }
}