(ns day-20-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-20 :refer [part1 part2]]))

(deftest day-20-test
  (testing "sample data"
    (is (= 0 (part1 "../data/20-sample.txt")))
    (is (= 0 (part2 "../data/20-sample.txt")))))
