use("weightChallenge");

//  Customers
db.customers.insertMany([
  {
    name: "Jane",
    email: "jane@example.com",
    createDate: new Date("2025-04-01")
  },
  {
    name: "Mike",
    email: "mike@example.com",
    createDate: new Date("2025-04-02")
  }
]);

//  Challenges
db.challenges.insertMany([
  {
    startDate: new Date("2025-05-01"),
    endDate: new Date("2025-06-01"),
    amount: 100,
    status: "Active"
  },
  {
    startDate: new Date("2025-06-10"),
    endDate: new Date("2025-07-10"),
    amount: 80,
    status: "Upcoming"
  }
]);

//  Measurements
db.measurements.insertMany([
  {
    customerId: null, // replace with ObjectId() of Jane or Mike if needed
    challengeId: null,
    date: new Date("2025-04-10"),
    weight: 180
  },
  {
    customerId: null,
    challengeId: null,
    date: new Date("2025-04-15"),
    weight: 175
  }
]);

//  Goals
db.goals.insertMany([
  {
    customerId: null,
    challengeId: null,
    goal: "Lose 10 lbs by June"
  }
]);
