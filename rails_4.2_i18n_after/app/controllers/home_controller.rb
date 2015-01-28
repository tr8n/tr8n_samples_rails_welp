class HomeController < ApplicationController

  def index
    @restaurants = [
        {
            name: "Ricky's Fish Tacos",
            rating:  4,
            review_count:  14,
            last_comment: "Luckily, the perfect hot day food is a fish taco."
        },
        {
            name: "Genwa Korean Bbq",
            rating:  3,
            review_count:  567,
            last_comment: "I love love love the fact that you get 25 side dishes."
        },
        {
            name: "Kang Hodong Baekjeong",
            rating:  2,
            review_count:  1,
            last_comment: "Thick slices of juicy pastrami on rye hits the spot every time."
        },
        {
            name: "Guisados",
            rating:  1,
            review_count:  14,
            last_comment: "I can't wait to introduce more people to these orgasmic tacos."
        }
    ];
  end
end
