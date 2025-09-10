(ns day-23-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-23 :refer [part1 part2]]))

(deftest day-23-test
  (testing "sample data"
    (is (= 0 (part1 "../data/23-sample.txt")))
    (is (= 0 (part2 "../data/23-sample.txt")))))
