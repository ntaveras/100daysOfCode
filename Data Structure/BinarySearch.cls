/* Author: Narayana Taveras
 * Description: 
 * 	Use this algorithm to search for an element in an ordered list.
 * Test Class: BinarySearchTest
 * Trigger Name: N/A
 * Change History:
 * 
 * - 15/Apr./23 - Created
 * 
*/
public with sharing class BinarySearch {
    
    public Integer doSearch(List<integer> nums, Integer target){
        if(nums.size() == 0) return -1;
        
        Integer lowerEnd = 0;
        Integer higherEnd = nums.size() - 1;
        Integer searchIndex;        
        while(lowerEnd <= higherEnd)
        {
            searchIndex = Math.floor(lowerEnd + (higherEnd - lowerEnd) / 2).intValue();
            if(nums[searchIndex] == target) return searchIndex;
            if(nums[searchIndex] > target)
            {
                higherEnd = searchIndex - 1;
            } else
            {
                lowerEnd = searchIndex + 1;
            }
        }
        return -1;
    }

}