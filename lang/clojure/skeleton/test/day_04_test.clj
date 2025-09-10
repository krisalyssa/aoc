(ns day-04-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-04 :refer [part1 part2]]))

(deftest day-04-test
  (testing "sample data"
    (is (= 0 (part1 "../data/04-sample.txt")))
    (is (= 0 (part2 "../data/04-sample.txt")))))
