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
    
    private final Node head;
    private final Node tail;
    public Integer size{
        private set;
        get;
    }
    public Boolean isEmpty{get{return size == 0;}}
    
    public DoubleLinkList(){
        this.head = new Node();
        this.tail = new Node();
        this.head.setNext(this.tail);
        this.tail.setPrev(this.head);
        this.size = 0;
    }
    
    public void addFirst(Object data){
        Node newNode = new Node(data);
        Node priorFirstNode = this.head.next; 
        newNode.setPrev(priorFirstNode.prev); 
        newNode.setNext(priorFirstNode); 
        priorFirstNode.setPrev(newNode); 
        this.head.setNext(newNode);
        this.size++;
    }
    
    public void addLast(Object data){
        Node newNode = new Node(data);
        Node priorLastNode = this.tail.prev;
        newNode.prev = priorLastNode;
        newNode.next = this.Tail;
        this.Tail.prev = newNode;
        priorLastNode.next = newNode;
        this.size++;
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
            Node newNode = new Node(data);
            Node targetNode = traverseList(index);
            newNode.prev = targetNode.prev;
            newNode.next = targetNode;
            targetNode.prev.next = newNode;
            targetNode.prev = newNode;
            this.size++;
        }
    }
    
    public Node traverseList(Integer index){
        if(this.isEmpty) throw new DoubleLinkListException('The List is empty.');
        isValidPosition(index);
        Integer counter = 0;
        Node currentNode = this.head;
        do{
            currentNode = currentNode.next;
        } while(++counter <= index && currentNode.hasNext);
        if(counter != index)
        {
            System.debug(LoggingLevel.INFO,
                         'The traversList() method did not complete, and is not returning the expected position #' + 
                         index + ' node but instead is returning the position #' + 
                         counter +'. This is likely due to the returned node not having a next node value of null.');
        }
        System.Debug('Traverse: ' + currentNode.data + '[' + counter +']');
        return currentNode;
    }
    
    public Node deleteFirst(){
        return deleteAt(0);
    }
    
    public Node deleteLast(){
        return deleteAt(this.size-1);
    }

    public Node deleteAt(Integer targetPosition){
        isValidPosition(targetPosition);
        Node deletedNode = traverseList(targetPosition);
        return deleteNode(deletedNode);
    }
    
    public Node deleteNode(Node targetNode){
        targetNode.prev.next = targetNode.next;
        targetNode.next.prev = targetNode.prev;
        this.size--;
        return targetNode;
    }
    
    public List<Object> listData(){
        List<Object> dataList = new List<Object>();
        if(this.isEmpty)
        {
            System.debug(LoggingLevel.INFO, 'The list if empty. An empty list of Objects is being returned.');            
        } else 
        {
            Node currentNode = traverseList(0);
            While(currentNode.hasNext)
            {
                System.debug(currentNode);
                dataList.add(currentNode.data);
                currentNode = currentNode.next;
            }                     
        }
        return dataList;        
    }
    
    private Boolean isValidPosition(Integer index){
        if(index <= this.size && index >= 0) return true;
        throw new DoubleLinkListException('Index out of bound.');
    }
    
    public class Node{
        
        public Node prev{
            get{ return this.prev;}
            private set;
        }
        public Node next{
            get{ return this.next;}
            private set;
        }
        public Object data{
            get{ return this.data;}
            private set;
        }
        public Boolean hasPrev{
            get{ return prev != null;}
        }
        public Boolean hasNext{
            get{ return next != null;}
        }
        
        private Node(){
            this(null);
        }
        
        private Node(Object data){
            this.data = data;
            this.prev = null;
            this.next = null;
        }
        
        public void setData(Object data){
            this.data = data;
        }
        
        public void setPrev(Node node){
            this.prev = node;
        }
        
        public void setNext(Node node){
            this.next = node;
        }
    }
}