#ifndef __PROGTEST__
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
#include <cassert>
#include <cmath>
using namespace std;
#endif /* __PROGTEST__ */

const int BLOCK_LIST_SIZE = 27;
const int BLOCK_SIZE = 32;

//Struct for one block of memory
struct Block
{
  int size;
  bool isFree;
  short id_genBlock;
  Block * addr; //for check valid of address in free function
  Block * next;
  Block * prev;
};

//Struct of pointers to head of linked list
struct BlockList
{
  Block * head;
};


//Global variables
int mem_pool_size;
Block * mem_pool_start;
int count_of_alloced_blocks;
BlockList freeBlocks[BLOCK_LIST_SIZE];


void   HeapInit    ( void * memPool, int memSize )
{
  //set start conditions for global variables
  mem_pool_start = (Block*)memPool;
  memset(freeBlocks, 0, sizeof(freeBlocks));
  count_of_alloced_blocks = 0;
  mem_pool_size = memSize;

  //get min size of free block 
  int pow_two = floor(log2(memSize));
  int blk_size = pow(2, pow_two);

  int mem_for_user = 0;
  int free_mem = memSize;
  short id_cnt = 1;

  //create first blocks
  while(blk_size > BLOCK_SIZE){
    freeBlocks[pow_two].head = (Block*)((uint64_t)memPool + mem_for_user);
    freeBlocks[pow_two].head->isFree = true;
    freeBlocks[pow_two].head->next = NULL;
    freeBlocks[pow_two].head->prev = NULL;
    freeBlocks[pow_two].head->addr = (Block*)((uint64_t)memPool + mem_for_user);
    freeBlocks[pow_two].head->size = blk_size;
    freeBlocks[pow_two].head->id_genBlock = id_cnt;  

    mem_for_user += blk_size; //for calculate start of new block
    free_mem -= blk_size; //size of free mem to use
    //new size of block
    pow_two = floor(log2(free_mem)); 
    blk_size = pow(2, pow_two);
    id_cnt++;
  }

}


void * HeapAlloc   ( int    size )
{
  //check input size 
  if(size > mem_pool_size || size <= 0) return NULL;

  //find ceil pow 2 of curent size
  int goal_idx = ceil(log2((size + sizeof(Block))));
  if(goal_idx <= 5) return NULL; //if input size is less or equal 32 bytes

  //if free block of input size don't exists
  if(freeBlocks[goal_idx].head == NULL){

    //find largest block with memory 
    int start_idx = goal_idx;
    while(freeBlocks[start_idx].head == NULL){
      start_idx++;
      if(start_idx >= BLOCK_LIST_SIZE) return NULL;
    }
    
    //split blocks
    while(start_idx != goal_idx){
      //find buddy
      Block * curent_buddy = (Block*)(((uint64_t)freeBlocks[start_idx].head->addr + (freeBlocks[start_idx].head->size/2)));
      
      //delete large block from list of free blocks
      Block * curent_block = freeBlocks[start_idx].head;
      freeBlocks[start_idx].head = freeBlocks[start_idx].head->next;
      if(freeBlocks[start_idx].head != NULL) freeBlocks[start_idx].head->prev = NULL;
      curent_block->next = NULL;
      curent_block->prev = NULL;

      //compute block size and decrease index
      start_idx--;
      int block_size = curent_block->size/2;

      //curent block
      freeBlocks[start_idx].head = curent_block->addr;
      freeBlocks[start_idx].head->addr = curent_block->addr;
      freeBlocks[start_idx].head->isFree = true;
      freeBlocks[start_idx].head->size = block_size;
      freeBlocks[start_idx].head->prev = NULL;
      freeBlocks[start_idx].head->id_genBlock = curent_block->id_genBlock;
        
      //his buddy
      freeBlocks[start_idx].head->next = curent_buddy;
      freeBlocks[start_idx].head->next->addr = curent_buddy;
      freeBlocks[start_idx].head->next->size = block_size;
      freeBlocks[start_idx].head->next->prev = freeBlocks[start_idx].head;
      freeBlocks[start_idx].head->next->next = NULL;
      freeBlocks[start_idx].head->next->isFree = true;
      freeBlocks[start_idx].head->next->id_genBlock = curent_block->id_genBlock;
    }
  }


  //block of input size exists
  Block * to_send = freeBlocks[goal_idx].head;
  to_send->isFree = false;

  //compute pointer to start memory for user
  Block * mem_to_user = (Block*)((uint64_t)to_send->addr + sizeof(Block));

  //delete block from free list
  freeBlocks[goal_idx].head = freeBlocks[goal_idx].head->next;
  if(freeBlocks[goal_idx].head != NULL) freeBlocks[goal_idx].head->prev = NULL;
  to_send->prev = NULL;
  to_send->next = NULL;
  
  count_of_alloced_blocks++;
  return mem_to_user;
}

//check buddy block
bool checkBuddy(Block * mem_to_free, Block * curent_block){
  Block * mem_pool_end = (Block*)((uint64_t)mem_pool_start + mem_pool_size); //find pointer to end of memPool 

  //check range
  if(mem_to_free < mem_pool_start || mem_to_free > mem_pool_end) return false;

  int check_size = mem_to_free->size & (mem_to_free->size - 1); //check if size is number 2^

  //check block
  if(mem_to_free->id_genBlock != curent_block->id_genBlock || curent_block->size != mem_to_free->size || mem_to_free->isFree != true || mem_to_free->size <= 0 || mem_to_free != mem_to_free->addr || check_size != 0){
    return false;
  }

  return true;
}

//check input block before free
bool checkBlock(Block * mem_to_free)
{
  Block * mem_pool_end = (Block*)((uint64_t)mem_pool_start + mem_pool_size); //find pointer to end of memPool 

  //check range
  if(mem_to_free < mem_pool_start || mem_to_free > mem_pool_end) return false;

  int check_size = mem_to_free->size & (mem_to_free->size - 1); //check if size is number 2^

  //check block
  if(mem_to_free->isFree != false || mem_to_free->size <= 0 || mem_to_free != mem_to_free->addr || check_size != 0){
    return false;
  }

  return true;
}

//find buddy
Block * findBuddy(Block * mem_to_free)
{
  uint64_t length_from_start = (uint64_t)mem_pool_start - (uint64_t)mem_to_free->addr;
  uint64_t left_right = length_from_start/mem_to_free->size;
  Block * buddy_addr;

  if(left_right % 2 == 0){
    buddy_addr = (Block*)((uint64_t)mem_to_free->addr + mem_to_free->size);
  }
  else{
    buddy_addr = (Block*)((uint64_t)mem_to_free->addr - mem_to_free->size);
  }

  return buddy_addr;
}

//insert block in list of free blocks
void insertBlock(Block * mem_to_free, int goal_idx)
{
  if(freeBlocks[goal_idx].head == NULL){
    freeBlocks[goal_idx].head = mem_to_free;
    freeBlocks[goal_idx].head->addr = mem_to_free->addr;
    freeBlocks[goal_idx].head->prev = NULL;
    freeBlocks[goal_idx].head->next = NULL;
    freeBlocks[goal_idx].head->isFree = true;
    freeBlocks[goal_idx].head->id_genBlock = mem_to_free->id_genBlock;
  }
  else{
    Block * iter_block = freeBlocks[goal_idx].head;
    while(iter_block->next != NULL){
      iter_block= iter_block->next;
    }
    iter_block->next = mem_to_free;
    iter_block->next->prev = iter_block;
    iter_block->next->next = NULL;
    iter_block->next->isFree = true;
    iter_block->next->addr = mem_to_free->addr;
    iter_block->next->id_genBlock = mem_to_free->id_genBlock;
  }
}

//delete block from list of free blocks
void deleteBlock(Block * buddy_addr, int goal_idx)
{
  Block * iter_block = freeBlocks[goal_idx].head;
  while(iter_block != buddy_addr){
    iter_block = iter_block->next;
  }
  if(iter_block->prev != NULL) iter_block->prev->next = iter_block->next;
  if(iter_block->next != NULL) iter_block->next->prev = iter_block->prev;
  if(iter_block->prev == NULL) freeBlocks[goal_idx].head = freeBlocks[goal_idx].head->next;
  buddy_addr->next = NULL;
  buddy_addr->prev = NULL;
}


bool   HeapFree    ( void * blk )
{
  //check input pointer
  if(blk == NULL) return false;

  //find block head
  Block * mem_to_free = (Block*)((uint64_t)blk - sizeof(Block));
  
  //check block 
  if(checkBlock(mem_to_free) == false) return false;

  //set this block as free
  mem_to_free->isFree = true; 
  
  //find index in array
  int goal_idx = ceil(log2(mem_to_free->size));
  
  //set start pointer
  Block * curent_block_addr = mem_to_free; 

  //merge blocks
  while(true){
    //find buddy
    Block * buddy_addr = findBuddy(curent_block_addr);

    //check buddy
    bool check_buddy_p = checkBuddy(buddy_addr, curent_block_addr);

    //if buddy wasn't found
    if(check_buddy_p == false){
      insertBlock(curent_block_addr, goal_idx);
      break;
    }
  
    //if buddy was found
    if(check_buddy_p == true){
      //if buddy block is AFTER freed block
      if(buddy_addr > curent_block_addr){
        deleteBlock(buddy_addr, goal_idx);
        curent_block_addr->isFree = true; //set this block as free
        curent_block_addr->size *= 2;
        goal_idx++;
      }
      //if buddy block is BEFORE freed block
      else{
        deleteBlock(buddy_addr, goal_idx);
        buddy_addr->isFree = true; //set this block as free
        buddy_addr->size *= 2;
        goal_idx++;
        curent_block_addr = buddy_addr;
      }
    }
  }

  count_of_alloced_blocks--;
  return true;
}


void   HeapDone    ( int  * pendingBlk )
{
  *pendingBlk = count_of_alloced_blocks;
}



#ifndef __PROGTEST__
int main ( void )
{
  uint8_t       * p0, *p1, *p2, *p3, *p4;
  int             pendingBlk;
  static uint8_t  memPool[3 * 1048576];
  uint8_t * tst = (uint8_t*)memPool;
  tst += 39;
  

  HeapInit ( memPool, 4095 );
  assert ( ( p0 = (uint8_t*) HeapAlloc ( 544 ) ) != NULL );
  memset ( p0, 0, 544 );
  assert ( ( p1 = (uint8_t*) HeapAlloc ( 544 ) ) != NULL );
  memset ( p1, 0, 544 );
  assert ( HeapFree ( p0 ) );
  assert ( HeapFree ( p1 ) );
  
  
  HeapInit ( memPool, 2097152 );
  assert ( ( p0 = (uint8_t*) HeapAlloc ( 511000 ) ) != NULL );
  memset ( p0, 0, 511000 );
  assert ( ( p1 = (uint8_t*) HeapAlloc ( 511000 ) ) != NULL );
  memset ( p1, 0, 511000 );
  assert ( ( p2 = (uint8_t*) HeapAlloc ( 26000 ) ) != NULL );
  memset ( p2, 0, 26000 );
  HeapDone ( &pendingBlk );
  assert ( pendingBlk == 3 );

  
  HeapInit ( memPool, 2097152 );
  assert ( ( p0 = (uint8_t*) HeapAlloc ( 1000000 ) ) != NULL );
  memset ( p0, 0, 1000000 );
  assert ( ( p1 = (uint8_t*) HeapAlloc ( 250000 ) ) != NULL );
  memset ( p1, 0, 250000 );
  assert ( ( p2 = (uint8_t*) HeapAlloc ( 250000 ) ) != NULL );
  memset ( p2, 0, 250000 );
  assert ( ( p3 = (uint8_t*) HeapAlloc ( 250000 ) ) != NULL );
  memset ( p3, 0, 250000 );
  assert ( ( p4 = (uint8_t*) HeapAlloc ( 50000 ) ) != NULL );
  memset ( p4, 0, 50000 );
  assert ( HeapFree ( p2 ) );
  assert ( HeapFree ( p4 ) );
  assert ( HeapFree ( p3 ) );
  assert ( HeapFree ( p1 ) );
  assert ( ! HeapFree ( tst ) );
  assert ( ( p1 = (uint8_t*) HeapAlloc ( 500000 ) ) != NULL );
  memset ( p1, 0, 500000 );
  assert ( HeapFree ( p0 ) );
  assert ( HeapFree ( p1 ) );
  HeapDone ( &pendingBlk );
  assert ( pendingBlk == 0 );

  
  HeapInit ( memPool, 2359296 );
  assert ( ( p0 = (uint8_t*) HeapAlloc ( 1000000 ) ) != NULL );
  memset ( p0, 0, 1000000 );
  assert ( ( p1 = (uint8_t*) HeapAlloc ( 500000 ) ) != NULL );
  memset ( p1, 0, 500000 );
  assert ( ( p2 = (uint8_t*) HeapAlloc ( 500000 ) ) != NULL );
  memset ( p2, 0, 500000 );
  assert ( ( p3 = (uint8_t*) HeapAlloc ( 500000 ) ) == NULL );
  assert ( HeapFree ( p2 ) );
  assert ( ( p2 = (uint8_t*) HeapAlloc ( 300000 ) ) != NULL );
  memset ( p2, 0, 300000 );
  assert ( HeapFree ( p0 ) );
  assert ( HeapFree ( p1 ) );
  HeapDone ( &pendingBlk );
  assert ( pendingBlk == 1 );


  HeapInit ( memPool, 2359296 );
  assert ( ( p0 = (uint8_t*) HeapAlloc ( 1000000 ) ) != NULL );
  memset ( p0, 0, 1000000 );
  assert ( ! HeapFree ( p0 + 1000 ) );
  HeapDone ( &pendingBlk );
  assert ( pendingBlk == 1 );
  

  return 0;
}
#endif /* __PROGTEST__ */

