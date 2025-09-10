(ns day-25-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-25 :refer [part1 part2]]))

(deftest day-25-test
  (testing "sample data"
    (is (= 0 (part1 "../data/25-sample.txt")))
    (is (= 0 (part2 "../data/25-sample.txt")))))
