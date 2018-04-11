# W4D5

+ Polymorphic Associations

---

## What is polymorphism?

---

**Demo**:

Status, Comment, Like

http://stackoverflow.com/questions/7326298/rails-3-find-parent-of-polymorphic-model-in-controller

## Rails Doctor
  - fill project with antipatterns and interactive demo
  - example project exists in NinetyNineCats repo under horrible-antipatterns
 
### antipatterns
- no model level validations
- writing out the url for form actions
- POSTing to new_urls
- button_to for get
- queries in views
- not using includes
  - N+1 queries
- using erb tags in actual ruby code
- not putting html tag attrs in quotes
- nested routes that should be top level
- user_id in hidden field


































---

# Deprecated:
# Content
## Forms and Basic Associations
* let associations drive design of forms
* `belongs_to` demo
* `has_many :through`

When building a feature its important to start with a vision of the goal first:
Draw out the form for building a trade "in a cloud"

input -> date
select -> company (belongs_to)
multiple inputs  -> transactions (has_many)
checkboxes -> categories (has_many through)

Given this form what data do we need?
Explain the domain of transaction tracker with an ERD of the associated objects

### Company
+  id
+  name
+  ticker

### Price
+  id
+  date
+  close

### Trade
+  id
+  company_id
+  date

### TradeTransaction
+  id
+  trade_id
+  price_per_share
+  shares

### Category
+  id
+  category

### TradeCategory
+  id
+  trade_id
+  category_id

Demo without `:inverse_of`
```rb
trade = Trade.new(date: Date.today, company_id: 1)
 # => #<Trade id: nil, company_id: 1, date: "2014-04-28 00:00:00", created_at: nil, updated_at: nil>
trade.trade_transactions.new([{ price_per_share: 4, shares: 5 }])
 # => [#<TradeTransaction id: nil, trade_id: nil, shares: 5.0, price_per_share: 4.0, created_at: nil, updated_at: nil>]
trade.trade_transactions.first.trade
 # => nil
```

Talk about [methods added by has_many](http://guides.rubyonrails.org/association_basics.html#has-many-association-reference)

Strong parameters works like this:
```rb
def transaction_params
  params.permit(transactions: [:price_per_share, :shares])
        .require(:transactions)
        .values
        .reject { |data| data.values.all?(&:blank?) }
end
def trade_params
  params.require(:trade)
        .permit(:date, :company_id, :category_ids => [])
end
```

Show all the forms
