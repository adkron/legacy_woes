ActiveRecord::Schema.define(:version => 1) do
  create_table :comments, :force => true do |t|
    t.date :dateSubmitted, :dateUpdated
    t.timestamp :timeSubmitted, :timeUpdated
  end
end