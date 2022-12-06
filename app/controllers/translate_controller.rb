# frozen_string_literal: true

# class TranslateController
class TranslateController < ApplicationController
  def input; end

  def output
    result = Result.find_by(in: params[:ch].to_i)
    if result
      @result_table = ActiveSupport::JSON.decode(result.out)
    else
      @result_table = calculate(params[:ch])
      (Result.create in: params[:ch].to_i, out: ActiveSupport::JSON.encode(@result_table)).save
    end
  end

  def json
    @db = Result.all
    render json: @db
  end

  def xml
    results = Result.all.map do |result|
      { out: result.in, output: result.out }
    end
    render xml: results
  end

  private

  def calculate(in_x)
    [in_x.to_i, in_x.to_i.to_s(2), in_x.to_i.to_s(2).reverse, in_x.to_i.to_s(2).reverse.to_i(2)]
  end
end
