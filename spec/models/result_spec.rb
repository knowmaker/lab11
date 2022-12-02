require 'rails_helper'

RSpec.describe Result, type: :model do
  it "checks performance of the model" do
    res = Result.find_by(in: 6)
    res&.destroy
    result = [6,'110','011',3]
    local_res = Result.create in: 6, out: ActiveSupport::JSON.encode(result)
    local_res.save
    res = Result.find_by(in: 6)
    db_result = ActiveSupport::JSON.decode(res.out)
    expect(db_result).to eq(result)
  end
  it "checks performance of the model for undubling" do
    res = Result.find_by(in: 6)
    res&.destroy
    result = [6,'110','011',3]
    result2 = [8,'1000','0001',1]
    local_res = Result.create in: 6, out: ActiveSupport::JSON.encode(result)
    local_res.save
    expect {
      local_res = Result.create in: 6, out: ActiveSupport::JSON.encode(result2)
      local_res.save
    }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end