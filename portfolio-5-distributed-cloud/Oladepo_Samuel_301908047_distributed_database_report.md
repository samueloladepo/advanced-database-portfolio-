\## 1. Cloud Database Deployment



The Library Management System was deployed using MongoDB Atlas, a cloud-hosted MongoDB database service.



A cloud database named `LibraryManagementCloud` was created with two collections: `Borrowers` and `Books`. Sample borrower and book documents were inserted successfully.



MongoDB Compass was used to connect to the cloud deployment and manage the database.



\## 2. Replication and High Availability



MongoDB Atlas uses replica sets to maintain multiple copies of database data across different members.



The `db.hello()` command was executed in the MongoDB shell to inspect the cloud deployment.



\### Actual implementation evidence



The command returned the following important information:



\- `setName`: atlas-midh5t-shard-0

\- `hosts`: Three replica-set member addresses were returned.

\- `primary`: The member ending in `shard-00-02` was identified as the primary.

\- `isWritablePrimary`: true

\- `provider`: AWS

\- `region`: EU\_WEST\_3

\- `ok`: 1



\### Analysis



The output confirms that the cloud deployment uses a replica set containing three listed members. The connected member was identified as the current primary and was able to accept write operations.



In a MongoDB replica set, the primary receives write operations while secondary members replicate the data. If the primary becomes unavailable, an eligible secondary can be elected as the new primary when the replica set retains the required voting majority.



This architecture improves data redundancy and availability.



The implementation demonstrates replica-set configuration through MongoDB Atlas. A manual failover test was not performed.



\## 3. Evidence



The screenshot `replication\_evidence.png` shows the actual output of the `db.hello()` command executed against the MongoDB Atlas cloud deployment.


Proposed Sharding Architecture





## Sharding Architecture

Sharding is a database technique used to distribute large amounts of data across multiple database servers called shards. Instead of storing all data on one server, the database divides the data into smaller portions and distributes them across different shards.

### Proposed Sharding Architecture

```text
                 Library Management Application
                              |
                              v
                       MongoDB Router
                          (mongos)
                              |
              +---------------+---------------+
              |               |               |
              v               v               v
          Shard 1          Shard 2          Shard 3
        (Replica Set)    (Replica Set)    (Replica Set)
         Primary           Primary          Primary
         Secondary         Secondary        Secondary
              |               |               |
              +---------------+---------------+
                              |
                              v
                    Config Server Replica Set
                    (Stores cluster metadata)
```

### How the Architecture Works

- **MongoDB Router (mongos):** Receives application requests and directs them to the appropriate shard.
- **Shards:** Store different portions of the library database.
- **Replica Sets:** Each shard can use replica-set members to provide redundancy and high availability.
- **Config Server Replica Set:** Stores metadata about the cluster, including how data is distributed across shards.

For this library system, a possible shard key would be `borrowerId`, using hashed distribution to spread borrower records across the shards.

### Implementation Limitation

The MongoDB Atlas free cluster used for this exercise demonstrated cloud hosting and replica-set architecture. Sharding was not configured in the cluster. Therefore, this diagram represents a proposed architecture for a larger deployment rather than an implemented sharded cluster.

Sharding would become useful if the library system grew significantly and needed to distribute its data and workload across multiple servers.




## Consistency Testing

A consistency test was performed on the MongoDB Atlas cloud database using MongoDB Shell.

The test involved inserting a document into the `ConsistencyTest` collection with a majority write concern:

```javascript
db.ConsistencyTest.insertOne(
  {
    testId: "majority-write-001",
    message: "Library cloud consistency test",
    createdAt: new Date()
  },
  {
    writeConcern: { w: "majority" }
  }
)
```

The document was then retrieved using `findOne()`.

**Result:** The insert operation was acknowledged successfully, and the document was retrieved with the expected values.

**Explanation:** The majority write concern requires the write to be acknowledged after a majority of replica-set members have applied it. This provides stronger write durability than acknowledging the write on the primary alone.

**Evidence:** `screenshots/consistency_test.png`

This test demonstrates a successful majority-acknowledged write and read-back. It does not independently verify replication lag or failover behaviour.