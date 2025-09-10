(ns day-24-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-24 :refer [part1 part2]]))

(deftest day-24-test
  (testing "sample data"
    (is (= 0 (part1 "../data/24-sample.txt")))
    (is (= 0 (part2 "../data/24-sample.txt")))))
