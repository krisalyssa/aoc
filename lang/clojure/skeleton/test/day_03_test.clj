(ns day-03-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-03 :refer [part1 part2]]))

(deftest day-03-test
  (testing "sample data"
    (is (= 0 (part1 "../data/03-sample.txt")))
    (is (= 0 (part2 "../data/03-sample.txt")))))
