/** 
* @Class Name 	: HashTable
* @Author       : Narayana Taveras
* @Description  : Implement a Hash Map data structure using A Linked list for Collision management, 
* Method signatures:
* - size() : Integer
* - isEmpty() : Boolean
* - containsKey(String) : Boolean
* - get(String) : Object
* - remove(String) : Object
* - keySet() : List<String>
* - values() : List<Object>
* @Trigger		: N/A
* @TestClass    : HashTableTest
* @ChangeHistory:
*   14/Mar./2023 - Created
**/
public class HashTable {
    private Integer size;
    private List<DoubleLinkList> bucketArray;
    
    public HashTable(){
        this(8);
    }
    
    public HashTable(Integer capacity){
        this.size = 0;
        this.bucketArray = new List<DoubleLinkList>();
        for(Integer i = 0; i < capacity; i++){
            this.bucketArray.add(null);
        }
    }
    
    public Integer size(){
        return this.size;
    }
    
    public Boolean isEmpty(){
        return (size() == 0);
    }
    
    public Boolean containsKey(String key){
        DoubleLinkList bucket = getBucket(key);
        return search(getHeadNode(bucket), key) != null;
    }
    
    public Object get(String key){
        DoubleLinkList bucket = getBucket(key);
        HashNode curNode = search(getHeadNode(bucket), key);
        Object resultData = null;
        if(curNode != null)
        {
            if(curNode.getKey() == key) resultData =  curNode.getData();
        } 
        return resultData;
    }
    
    public void put(String key, Object data){
        HashNode targetNode;
        DoubleLinkList bucket = getBucket(key);
        Integer bucketSizePriorToOperation = bucket.size;
        if(!containsKey(key))
        {
            targetNode = new HashNode(key, data, generateHash(key));
            bucket.addFirst(targetNode);
        } else{
            targetNode = search(getHeadNode(bucket), key);
        }
        targetNode.setData(data);
        
        this.size += bucket.size - bucketSizePriorToOperation;
    }
    
    public Object remove(String key){
        if(!containsKey(key)) return null;
        DoubleLinkList bucket = getBucket(key);
        Integer bucketSizePriorToOperation = bucket.size;
        HashNode targetNode = search(getHeadNode(bucket), key);
        Object data = bucket.deleteNode(targetNode).getData();
        this.size += bucket.size - bucketSizePriorToOperation;
        return data;
    }
    
    public List<String> keySet(){
        List<String> keys = new List<String>();
        for(Integer index = 0; index < this.bucketArray.size(); index++)
        {
            DoubleLinkList curBucket = this.bucketArray[index];
            if(curBucket == null || curBucket.isEmpty) continue;
            DoubleLinkedNode currentNode = (HashNode) getHeadNode(curBucket); 
            While(currentNode.hasNext())
            {
                HashNode tmp = (HashNode) currentNode; // <-- How would you manage this?
                keys.add(tmp.getKey());
                currentNode =  currentNode.getNext();
            }
        }
        
        return keys;
    }
    
    public List<Object> values(){
        List<Object> values = new List<Object>();
        for(Integer index = 0; index < this.bucketArray.size(); index++)
        {
            DoubleLinkList curBucket = this.bucketArray[index];
            if(curBucket == null || curBucket.isEmpty) continue;
            DoubleLinkedNode currentNode = (HashNode) getHeadNode(curBucket);
            While(currentNode.hasNext())
            {
                values.add(currentNode.getData());
                currentNode = currentNode.getNext();
            }
        }
        return values;
    }
    
    // ***** Helper methods ***** //
    
    private HashNode search(HashNode headNode, String key){
        if(headNode != null)
        {
            while(headNode.getKey() != key && headNode.getNext().hasNext())
            {
                headNode = (HashNode) headNode.getNext();
            }
            if(headNode.getKey() == key) return headNode;
        }
        return null;
    }
    
    private HashNode getHeadNode(DoubleLinkList bucket){
        if(bucket.isEmpty) return null;
        return (HashNode) bucket.traverseList(0);        
    }
    
    private DoubleLinkList getBucket(String key){
        Integer index = Math.mod(generateHash(key), bucketArray.size());
        if(this.bucketArray[index] == null) this.bucketArray[index] = new DoubleLinkList();
        DoubleLinkList bucket = this.bucketArray[index];
        return bucket;
    }
    
    public Integer generateHash(String key){
        Integer hash = 0;
        for(Integer i = 0; i < key.length(); i++)
        {
            hash = (hash + System.hashCode(key.charAt(i)) * i);
        }
        return hash;
    }
    
    // ***** Hash Node Sub-class ***** //
    public class HashNode implements DoubleLinkedNode {
        private Object data;
        private DoubleLinkedNode prev;
        private DoubleLinkedNode next;
        private final Integer HASHED_KEY;
        private final String KEY;
        
        public HashNode(String key, Object data, Integer hashedKey){
            this.KEY = key;
            this.data = data;
            this.HASHED_KEY = hashedKey;        
        }
        
        public void setData(Object data){
            this.data = data;
        }
        
        public Object getData(){
            return this.data;
        }
        
        public void setPrev(DoubleLinkedNode prevNode){
            this.prev = prevNode;
        }
        
        public DoubleLinkedNode getPrev(){
            return this.prev;
        }
        
        public void setNext(DoubleLinkedNode nextNode){
            this.next = nextNode;
        }
        
        public DoubleLinkedNode getNext(){
            return this.next;
        }
        
        public Boolean hasPrev(){
            return prev != null;
        }
        
        public Boolean hasNext(){
            return this.next != null;
        }
        
        public String getKey(){
            return this.KEY;
        }
        
        public integer getHashedKey(){
            return this.HASHED_KEY;
        }
    }
}