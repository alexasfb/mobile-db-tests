# Mobile DB Tests
The purpose of this project is to test performances of mobile DBs libraries on iOS. Two tests are ran: writing and reading.

Here are the tested databases:
- Core Data
- Realm
- CouchBase Lite - SQLite mode
- CouchBase Lite - ForestDB mode

# How to run ?
- Clone the project
- do a ``pod update`` in the directory
- Open the workspace file
- Compile and launch

# Results
 
                       Write test        |       Read test  
                 (operations / second)   |   (operations / second)
Core Data                 7401           |          39
Realm                     21341          |          28632
Couchbase SQLite          704            |          54
Couchbase ForestDB        695            |          2334

#Links
- Realm
	- https://realm.io/
	- https://github.com/realm

- CouchBase
	- http://www.couchbase.com/nosql-databases/couchbase-mobile
	- https://github.com/couchbase/

