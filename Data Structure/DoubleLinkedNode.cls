public interface DoubleLinkedNode {
    
    void setData(Object data);
    
    Object getData();
    
    void setPrev(DoubleLinkedNode prevNode);
    
    DoubleLinkedNode getPrev();
    
    void setNext(DoubleLinkedNode nextNode);
        
    DoubleLinkedNode getNext();
    
    Boolean hasPrev();
    
    Boolean hasNext();
}